FROM quay.io/fedora/fedora-bootc@sha256:115ca07abdb59ecf59cb4e02fba559ab261105b7745338192fa26c5eb14c8ef5

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
