# 1. SSH into the jump host
ssh thor@jump_host.stratos.xfusioncorp.com
# password: mjolnir123

# 2. From the jump host, SSH into App Server 3
ssh banner@stapp03.stratos.xfusioncorp.com
# password: BigGr33n

# 3. Create the temporary user with expiry date
sudo useradd -e 2024-01-28 anita

# 4. Verify the expiry date
sudo chage -l anita
