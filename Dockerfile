FROM quay.io/fedora/fedora-bootc 

#
# empty space for easier rebasing
#
COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
