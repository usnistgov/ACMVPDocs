#!/bin/bash

#This is part of the larger script file:  Above this creates the VPC's, Subnets, RT, etc.

 ############ STEP 13 - attach TGW to VPCs and accept attachments for PROD VPC
  #Create the transit gateway attachments. Will use the subnet A for each VPC
  echo "Now creating the TGW attachment to Production VPC" | tee -a "$script_output_file"
  tgw_attach_prod_id=$(aws ec2 create-transit-gateway-vpc-attachment \
    --transit-gateway-id "$tgw_id" \
    --vpc-id "$vpc_prod_id" \
    --subnet-ids "$subneta_prod_id" "$subnetb_prod_id" "$subnetlambdaa_prod_id" "$subnetlambdab_prod_id"\
    --tag-specifications "ResourceType=transit-gateway-attachment,Tags=[{Key=Name,Value=$lab_name-Prod-to-Management}]" \
    --query "TransitGatewayVpcAttachment.TransitGatewayAttachmentId" \
    --output text \
    --profile "$full_lab_name" \
    )

  #Retrieve the state of the attachment. It must be pending acceptance before accepting the attachment
  tgw_attach_prod_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayVpcAttachments[0].State" \
    --output text \
    )

  echo "The TGW attachment state is $tgw_attach_prod_state."

  #keeping checking status until it is pendingacceptance
  while [[ $tgw_attach_prod_state != "pendingAcceptance" ]]
  do
    echo "The $tgw_attach_prod_id attachment request is $tgw_attach_prod_state..Sleeping for 10 seconds" | tee -a "$script_output_file"
    sleep 10
    tgw_attach_prod_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
      --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
      --profile "$full_lab_name" \
      --query "TransitGatewayVpcAttachments[0].State" \
      --output text \
      )
  done

  echo "The TGW attachment state is $tgw_attach_prod_state."

  #Accept TGW attachment
  #requires the attachment state to be pendingAcceptance before accepting.
  

  #Create attachment for each VPC
  #create attachment for each subnet in each VPC
  #when accepting the attachment, it automatically gets linked with the Inspection_from_Firewall_RT -N-S

# Step 13.b.ii
  echo "Now accepting the TGW attachment to Production VPC" | tee -a "$script_output_file"
  aws ec2 accept-transit-gateway-vpc-attachment \
    --transit-gateway-attachment-id "$tgw_attach_prod_id" \
    --profile mgmt

  #check attachment status now
  tgw_attach_prod_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayVpcAttachments[0].State" \
    --output text \
    )

# Step 13.c
  while [[ $tgw_attach_prod_state != "available" ]]
  do
    echo "The $tgw_attach_prod_id attachment request is $tgw_attach_prod_state..Sleeping for 10 seconds" | tee -a "$script_output_file"
    sleep 10
    tgw_attach_prod_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
      --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
      --profile "$full_lab_name" \
      --query "TransitGatewayVpcAttachments[0].State" \
      --output text \
      )
  done

  echo "The state of the TGW attachment to the production VPC  is $tgw_attach_prod_state."

  echo "Now creating the attachment to the Dev VPC" | tee -a "$script_output_file"


  tgw_attach_dev_id=$(aws ec2 create-transit-gateway-vpc-attachment \
    --transit-gateway-id "$tgw_id" \
    --vpc-id "$vpc_dev_id" \
    --subnet-ids "$subneta_dev_id" "$subnetb_dev_id" \
    --tag-specifications "ResourceType=transit-gateway-attachment,Tags=[{Key=Name,Value=$lab_name-Dev-to-Management}]" \
    --query "TransitGatewayVpcAttachment.TransitGatewayAttachmentId" \
    --output text \
    --profile "$full_lab_name" \
    )


  #is the attachment currently pending?
  tgw_attach_dev_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayVpcAttachments[0].State" \
    --output text \
    )

  echo "The TGW attachment state is $tgw_attach_dev_state."

  #keeping checking status until it is pending. this may not need to happen if it's pending immediately
  while [[ $tgw_attach_dev_state != "pendingAcceptance" ]]
  do
    echo "The $tgw_attach_dev_id attachment request is $tgw_attach_dev_state..Sleeping for 10 seconds" | tee -a "$script_output_file"
    sleep 10
    tgw_attach_dev_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
      --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
      --profile "$full_lab_name" \
      --query "TransitGatewayVpcAttachments[0].State" \
      --output text \
      )
  done

  echo "The $tgw_attach_dev_id attachment request is $tgw_attach_dev_state."


  ############ STEP 13 - Accept TGW attachment DEV VPC
  #requires the attachment state to be pendingAcceptance before accepting.
  #is this the mgmt account?

  #Create attachment for each VPC
  #create attachment for each subnet in each VPC
  #when accepting the attachment, it automatically gets linked with teh Inspection_from_Firewall_RT -N-S
  #delete the new attachment
  echo "Now accepting the TGW attachment to the Dev VPC" | tee -a "$script_output_file"

  aws ec2 accept-transit-gateway-vpc-attachment \
    --transit-gateway-attachment-id "$tgw_attach_dev_id" \
    --profile mgmt

  #check attachment status now
  tgw_attach_dev_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayVpcAttachments[0].State" \
    --output text \
    )

  while [[ $tgw_attach_dev_state != "available" ]]
  do
    echo "The $tgw_attach_dev_id attachment request is $tgw_attach_dev_state..Sleeping for 10 seconds" | tee -a "$script_output_file"
    sleep 10
    tgw_attach_dev_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
      --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
      --profile "$full_lab_name" \
      --query "TransitGatewayVpcAttachments[0].State" \
      --output text \
      )
  done

  echo "The TGW attachment state is now $tgw_attach_dev_state." | tee -a "$script_output_file"

  echo "Now creating the TGW attachment to the Test VPC" | tee -a "$script_output_file"
  #create TGW attachment for test VPC
  tgw_attach_test_id=$(aws ec2 create-transit-gateway-vpc-attachment \
    --transit-gateway-id "$tgw_id" \
    --vpc-id "$vpc_test_id" \
    --subnet-ids "$subneta_test_id" "$subnetb_test_id" \
    --tag-specifications "ResourceType=transit-gateway-attachment,Tags=[{Key=Name,Value=$lab_name-Test-to-Management}]" \
    --query "TransitGatewayVpcAttachment.TransitGatewayAttachmentId" \
    --output text \
    --profile "$full_lab_name" \
    )


  #is the attachment currently pending?
  tgw_attach_test_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_test_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayVpcAttachments[0].State" \
    --output text \
    )

  echo "The TGW attachment state is $tgw_attach_test_state."

  #keeping checking status until it is pending. this may not need to happen if it's pending immediately
  while [[ $tgw_attach_test_state != "pendingAcceptance" ]]
  do
    echo "The $tgw_attach_test_id attachment request is $tgw_attach_test_state..Sleeping for 10 seconds" | tee -a "$script_output_file"
    sleep 10
    tgw_attach_test_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
      --transit-gateway-attachment-ids "$tgw_attach_test_id" \
      --profile "$full_lab_name" \
      --query "TransitGatewayVpcAttachments[0].State" \
      --output text \
      )
  done

  echo "Now accepting the TGW attachment to the Test VPC" | tee -a "$script_output_file"

  ############ STEP 13 - Accept TGW attachment TEST VPC
  #requires the attachment state to be pendingAcceptance before accepting.
  #is this the mgmt account?

  #Create attachment for each VPC
  #create attachment for each subnet in each VPC
  #when accepting the attachment, it automatically gets linked with the Inspection_from_Firewall_RT -N-S
  #delete the new attachment
  aws ec2 accept-transit-gateway-vpc-attachment \
    --transit-gateway-attachment-id "$tgw_attach_test_id" \
    --profile mgmt

  #check attachment status now
  tgw_attach_test_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_test_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayVpcAttachments[0].State" \
    --output text \
    )

  while [[ $tgw_attach_test_state != "available" ]]
  do
    echo "The $tgw_attach_test_id attachment request is $tgw_attach_test_state..Sleeping for 10 seconds" | tee -a "$script_output_file"
    sleep 10
    tgw_attach_test_state=$(aws ec2 describe-transit-gateway-vpc-attachments \
      --transit-gateway-attachment-ids "$tgw_attach_test_id" \
      --profile "$full_lab_name" \
      --query "TransitGatewayVpcAttachments[0].State" \
      --output text \
      )
  done

  echo "The TGW attachment state to the Test VPC is $tgw_attach_test_state." | tee -a "$script_output_file"
  ############ STEPS 13e-m ##############

  #delete the new TGW attachment associations (3 of them) from the MGMT account's tgw route table id (ending in e114)

  #when the attachment is accepted it gets attached to the Inspection_from_Firewall TGW route table.
  #delete the attachment from that route table (under associations)  (check status of deletion)
  #add the attachment to the association of the Spoke_TGW route table (check for associating status)

  #Using modified version of Kyle's code below:

  echo "removing prod TGWA from Inspection_From_Firewall_RT ..."
  #g-i -- remove TGA from route table
  aws ec2 disassociate-transit-gateway-route-table \
      --transit-gateway-route-table-id "$InspectionFirewallRT" \
      --transit-gateway-attachment-id "$tgw_attach_prod_id" \
      --profile mgmt

  echo "removing Dev TGWA from Inspection_From_Firewall_RT ..."
  #g-i -- remove TGA from route table
  aws ec2 disassociate-transit-gateway-route-table \
      --transit-gateway-route-table-id "$InspectionFirewallRT" \
      --transit-gateway-attachment-id "$tgw_attach_dev_id" \
      --profile mgmt

  echo "removing Test TGWA from Inspection_From_Firewall_RT ..."
  #g-i -- remove TGA from route table
  aws ec2 disassociate-transit-gateway-route-table \
      --transit-gateway-route-table-id "$InspectionFirewallRT" \
      --transit-gateway-attachment-id "$tgw_attach_test_id" \
      --profile mgmt

  #loop over the status of the the route table associations
  #when this status no longer has an Association.State value
  #the query will return None, at which point the loop will stop
  # and we can move on to re-associating the attachments
  sleep 5

  tgw_attach_test_state=$(aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_test_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayAttachments[0].Association.State" \
    --output text \
    )

  #is there a better status to check?
  while [[ $tgw_attach_test_state != "None" ]]
  do
    echo "The $tgw_attach_test_id association status is $tgw_attach_test_state..Sleeping for 5 seconds" | tee -a "$script_output_file"
    sleep 5
    tgw_attach_test_state=$(aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_test_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayAttachments[0].Association.State" \
    --output text \
    )
  done

  tgw_attach_dev_state=$(aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayAttachments[0].Association.State" \
    --output text \
    )

  #is there a better status to check?
  while [[ $tgw_attach_dev_state != "None" ]]
  do
    echo "The $tgw_attach_dev_id association status is $tgw_attach_dev_state..Sleeping for 5 seconds" | tee -a "$script_output_file"
    sleep 5
    tgw_attach_dev_state=$(aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayAttachments[0].Association.State" \
    --output text \
    )
  done

  tgw_attach_prod_state=$(aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayAttachments[0].Association.State" \
    --output text \
    )

  #is there a better status to check?
  while [[ $tgw_attach_prod_state != "None" ]]
  do
    echo "The $tgw_attach_prod_id association status is $tgw_attach_prod_state..Sleeping for 5 seconds" | tee -a "$script_output_file"
    sleep 5
    tgw_attach_prod_state=$(aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
    --profile "$full_lab_name" \
    --query "TransitGatewayAttachments[0].Association.State" \
    --output text \
    )
  done

  #for good measure, checking the status again.
  echo "check the association status for the three attachments. There should be no 'Association' output now."
  aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_prod_id" \
    --profile "$full_lab_name" \
    >> "$script_output_file"

  aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_dev_id" \
    --profile "$full_lab_name" \
    >> "$script_output_file"

  aws ec2 describe-transit-gateway-attachments \
    --transit-gateway-attachment-ids "$tgw_attach_test_id" \
    --profile "$full_lab_name" \
    >> "$script_output_file"

  echo "Now associating the tgw attachments to the Spoke_TGW_RT..." | tee -a "$script_output_file"

  #j-m
  aws ec2 associate-transit-gateway-route-table \
      --transit-gateway-route-table-id "$SpokeTGWRT" \
      --transit-gateway-attachment-id "$tgw_attach_prod_id" \
      --profile mgmt \
      >> "$script_output_file"

  aws ec2 associate-transit-gateway-route-table \
      --transit-gateway-route-table-id "$SpokeTGWRT" \
      --transit-gateway-attachment-id "$tgw_attach_dev_id" \
      --profile mgmt \
      >> "$script_output_file"

  aws ec2 associate-transit-gateway-route-table \
      --transit-gateway-route-table-id "$SpokeTGWRT" \
      --transit-gateway-attachment-id "$tgw_attach_test_id" \
      --profile mgmt \
      >> "$script_output_file"

  aws ec2 describe-transit-gateway-route-tables \
    --transit-gateway-route-table-ids "$SpokeTGWRT" \
    --profile mgmt \
      >> "$script_output_file"



#label the tgw attachments in the mgmt account
aws ec2 create-tags \
  --resources "$tgw_attach_prod_id" \
  --tags Key=Name,Value=TGA_From_"$lab_name"_Prod \
  --profile mgmt

aws ec2 create-tags \
  --resources "$tgw_attach_dev_id" \
  --tags Key=Name,Value=TGA_From_"$lab_name"_Dev \
  --profile mgmt

  aws ec2 create-tags \
  --resources "$tgw_attach_test_id" \
  --tags Key=Name,Value=TGA_From_"$lab_name"_Test \
  --profile mgmt


  ########## STEP 14 - Create TGW routes in new account, and create SG

  #rename routes. Do this in the TGW cloudformation. Step 12.


  #Create the SG for the isntances. Consider adding this to the CF YML when the instances are initially created
  #Add route to route table. Use variables for route table and TGW

  echo "Creating the route tables for the three VPCs..." | tee -a "$script_output_file"

  rt_prod_id=$(aws ec2 create-route-table \
    --vpc-id "$vpc_prod_id" \
    --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=RT-$namespace-Production}]" \
    --query "RouteTable.RouteTableId" \
    --output text \
    --profile "$full_lab_name" \
    )

  rt_prod_lambda_id=$(aws ec2 create-route-table \
    --vpc-id "$vpc_prod_id" \
    --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=RT-$namespace-Production-lambda}]" \
    --query "RouteTable.RouteTableId" \
    --output text \
    --profile "$full_lab_name" \
    )

  rt_dev_id=$(aws ec2 create-route-table \
    --vpc-id "$vpc_dev_id" \
    --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=RT-$namespace-Development}]" \
    --query "RouteTable.RouteTableId" \
    --output text \
    --profile "$full_lab_name" \
    )

  rt_test_id=$(aws ec2 create-route-table \
    --vpc-id "$vpc_test_id" \
    --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=RT-$namespace-Test}]" \
    --query "RouteTable.RouteTableId" \
    --output text \
    --profile "$full_lab_name" \
    )

#associate route tables with the subnets
echo "Associate each VPC's subnets with the corresponding Route Table..." | tee -a "$script_output_file"
aws ec2 associate-route-table \
  --route-table-id "$rt_prod_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subneta_prod_id" \
  >> "$script_output_file"

aws ec2 associate-route-table \
  --route-table-id "$rt_prod_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subnetb_prod_id" \
  >> "$script_output_file"

### Associating lambda function RT ###
aws ec2 associate-route-table \
  --route-table-id "$rt_prod_lambda_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subnetlambdaa_prod_id" \
  >> "$script_output_file"

aws ec2 associate-route-table \
  --route-table-id "$rt_prod_lambda_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subnetlambdab_prod_id" \
  >> "$script_output_file"

aws ec2 associate-route-table \
  --route-table-id "$rt_dev_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subneta_dev_id" \
  >> "$script_output_file"

aws ec2 associate-route-table \
  --route-table-id "$rt_dev_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subnetb_dev_id" \
  >> "$script_output_file"

aws ec2 associate-route-table \
  --route-table-id "$rt_test_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subneta_test_id" \
  >> "$script_output_file"

aws ec2 associate-route-table \
  --route-table-id "$rt_test_id" \
  --profile "$full_lab_name" \
  --subnet-id "$subnetb_test_id" \
  >> "$script_output_file"

# Create endpoint for service