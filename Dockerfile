FROM quay.io/fedora/fedora-bootc@sha256:b97f52eb3f6c7207d1160dd86a916a851d99aaebf0fb03de2caabfc89a5c887c

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
