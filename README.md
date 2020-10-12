# ansible-docker
Ansible role that installs [Docker](https://www.docker.com) and Docker Compose on Ubuntu 
## Requirements

None.

## Role Variables

Docker channel

    docker_release_channel: stable

You can switch the channel to `edge` if you want to use the Edge release.
    
Docker Users

    docker_users:
      - Dustin
      - Steve

A list of system users to be added to the `docker` group

## Example Playbook

    ---
    - hosts: all
      become: yes

      vars:
        docker_release_channel: stable
        docker_users:
        - ross
        
      roles:
        - ansible-role-docker
