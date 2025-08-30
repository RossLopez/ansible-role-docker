# Ansible Role: Docker

[![CI](https://github.com/rosslopez/ansible-role-docker/workflows/CI/badge.svg)](https://github.com/rosslopez/ansible-role-docker/actions)

Modern Ansible role that installs [Docker Engine](https://www.docker.com) and Docker Compose on Linux distributions including Ubuntu, Debian, and RHEL/CentOS. 
## Requirements

- Ansible 2.12 or higher
- Supported OS:
  - Ubuntu 20.04, 22.04, 24.04
  - Debian 11, 12
  - RHEL/CentOS 8, 9
  - Rocky Linux 8, 9

## Role Variables

### Docker Configuration

**Docker release channel:**
```yaml
docker_release_channel: stable  # Options: stable, test
```

**Docker version:**
```yaml
docker_version: latest  # Use 'latest' or specific version like '24.0.7'
```

**Docker Compose configuration:**
```yaml
docker_compose_version: latest              # Use 'latest' or specific version
docker_compose_install_method: plugin       # Options: plugin (recommended), standalone
```

**Service configuration:**
```yaml
docker_service_state: started
docker_service_enabled: true
docker_start_on_boot: true
```

**Package management:**
```yaml
docker_package_state: present  # Options: present (recommended), latest
```

### User Management

**Docker users:**
```yaml
docker_users: []
# Example:
# docker_users:
#   - alice
#   - bob
```
A list of system users to be added to the `docker` group (allows running Docker without sudo).

### Advanced Configuration

**Docker daemon options:**
```yaml
docker_daemon_options: {}
# Example:
# docker_daemon_options:
#   log-driver: "json-file"
#   log-opts:
#     max-size: "10m"
#     max-file: "3"
```

**Security options:**
```yaml
docker_userns_remap: false                 # Enable user namespace remapping
docker_userns_remap_user: "dockremap"      # User for namespace remapping
docker_rootless: false                     # Install rootless Docker
```

**Network configuration:**
```yaml
docker_tcp_listen: false                   # Enable TCP socket (WARNING: Security risk)
docker_tcp_port: 2376
docker_tls_enabled: false
```

**Storage configuration:**
```yaml
docker_storage_driver: ""                  # Leave empty for default
```

## Example Playbook

### Basic Installation
```yaml
---
- hosts: all
  become: yes
  roles:
    - rosslopez.docker
```

### Advanced Configuration
```yaml
---
- hosts: docker_hosts
  become: yes
  vars:
    docker_release_channel: stable
    docker_version: "24.0.7"
    docker_compose_version: "2.24.0"
    docker_users:
      - alice
      - bob
    docker_daemon_options:
      log-driver: "json-file"
      log-opts:
        max-size: "10m"
        max-file: "3"
  roles:
    - rosslopez.docker
```

### Rootless Docker Installation
```yaml
---
- hosts: development
  become: yes
  vars:
    docker_rootless: true
    docker_users:
      - developer
  roles:
    - rosslopez.docker
```

## Dependencies

This role requires the following Ansible collections:
- `community.general`
- `ansible.posix`

These will be automatically installed when using this role via Ansible Galaxy.

## License

MIT

## Author Information

This role was created by [Ross Lopez](https://github.com/rosslopez).
