FROM quay.io/fedora/fedora-bootc@sha256:75fce251b64549f30393059eab6384bddbad4a70ae1bd07dbabfbc13ccb527b9

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
