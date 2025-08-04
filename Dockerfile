FROM quay.io/fedora/fedora-bootc@sha256:64a119493dffe53fb7a9bbb07574a4658dfadffab0d22ba1cb3874c2a4a623e4

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
