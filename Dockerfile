FROM quay.io/fedora/fedora-bootc@sha256:03bc05afb5642aa1193c34b1a7a8fe78537106b93fe0f70e3bc674dfd5b257ac

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
