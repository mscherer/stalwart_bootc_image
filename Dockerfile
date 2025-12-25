FROM quay.io/fedora/fedora-bootc@sha256:597b9cb204a467088c470dbbfe632994d851b227470c00e845d4d773410abd46

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
