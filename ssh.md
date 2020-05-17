# SSH

```bash
$ sudo apt update
$ sudo apt install openssh-server

# Confirm ssh is running
$ sudo systemctl status ssh

# Open firewall
$ sudo ufw allow ssh

# Get IP
$ ip a

## NOW ON A DIFFERENT MACHINE

# Generate SSH key
$ ssh-keygen -t rsa -b 4096 -f ~/.ssh/alichtman-KEYNAME -C "DESCRIPTION"

# SSH into machine and install key
ssh-copy-id -i $HOME/.ssh/alichtman-KEYNAME.pub alichtman@IP
```

Now, we need to secure SSH on the original machine. We'll disallow root SSH login and password-based login.

Open `/etc/ssh/sshd_config` in vim and set the following options:

```bash
PermitRootLogin no
PasswordAuthentication no
PermitEmptyPasswords no
```

Run `$ /etc/init.d/ssh reload` and verify this worked properly.

```bash
# Should fail
$ ssh root@IP

# Should fail
$ ssh alichtman@IP -o PubkeyAuthentication=no

# Should work
$ ssh alichtman@IP -i ~/.ssh/alichtman-KEYNAME
```

Now, add it to your `~/.ssh/config` file in this format for ease of use:

```
Host HOSTNAME
	HostName 192.168.1.1
	User alichtman
	IdentityFile /Users/alichtman/.ssh/arctic-alichtman
	AddKeysToAgent yes
```

You can then ssh with `$ ssh HOSTNAME`.
