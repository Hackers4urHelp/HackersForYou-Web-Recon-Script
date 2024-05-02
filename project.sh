
#!/bin/bash

echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "------------------------Welcome to the HackersForYou Web Recon Script--------------------------"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
echo "**********************************************************************************************"
read -p "Please Enter a URL: " url


# Create a directory for the target
target_dir="$url"_recon
mkdir -p "$target_dir"

# Make dedicated directories for reconnaissance
mkdir -p "$target_dir/subdomains"
mkdir -p "$target_dir/live_subdomains"
mkdir -p "$target_dir/eyewitness_screenshots"
mkdir -p "$target_dir/secret_js_links"
mkdir -p "$target_dir/nmap_scans"

# Gather subdomains using sublist3r, subfinder, and chaos
echo "Gathering subdomains..."
sublist3r -d "$url" -o "$target_dir/subdomains/sublist3r.txt"
subfinder -d "$url" -o "$target_dir/subdomains/subfinder.txt"
#chaos -d "$url" -o "$target_dir/subdomains/chaos.txt"

# Merge and deduplicate subdomain lists
echo "Merging and deduplicating subdomain lists..."
cat "$target_dir/subdomains/"*.txt | sort -u > "$target_dir/subdomains/all_subdomains.txt"

# Run httpx and httprobe on the final list of subdomains
echo "Checking for live subdomains..."
cat "$target_dir/subdomains/all_subdomains.txt" | httpx-toolkit  -o "$target_dir/live_subdomains/httpx.txt"
#cat "$target_dir/subdomains/all_subdomains.txt" | httprobe -c 50 -t 3000 -o "$target_dir/live_subdomains/httprobe.txt"

# Merge results from httpx and httprobe to get final list of live subdomains
echo "Merging results from httpx and httprobe..."
cat "$target_dir/live_subdomains/"*.txt | sort -u > "$target_dir/live_subdomains/final_live_subdomains.txt"

# Run Nmap scan on the live subdomains
echo "Running Nmap scan on live subdomains..."
mkdir -p "$target_dir/nmap_scans"
nmap -iL "$target_dir/live_subdomains/final_live_subdomains.txt" -oA "$target_dir/nmap_scans/nmap_scan"

# Notify the user
echo "Reconnaissance for $url completed. Results saved in $target_dir."




