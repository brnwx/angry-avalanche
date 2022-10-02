#!/bin/bash

vast search offers
read -p "Offer ID: " offer_id

vast create instance $offer_id --image dizcza/docker-hashcat:cuda --disk 32
