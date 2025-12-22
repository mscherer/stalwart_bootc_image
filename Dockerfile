FROM quay.io/fedora/fedora-bootc@sha256:03187194969f6cb3265307dcca6ffb78ce933fb3f2f807bec93a3ade5f353698

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
