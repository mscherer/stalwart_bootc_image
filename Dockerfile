FROM quay.io/fedora/fedora-bootc@sha256:7a3e3a86a9855b98eda7f9c905ee569d9087b95c6ae782dfb95ad6af9e6f800b

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
