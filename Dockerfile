FROM quay.io/fedora/fedora-bootc@sha256:0288bd0133e0125e1ae0e2e21d381bf6e749e40ae47b8ed75061f2f1c530d118

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
