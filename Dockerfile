FROM quay.io/fedora/fedora-bootc@sha256:36ae7b3b6e3e4f6e4b236deebdfe46bbe3f82a0beddacc2a44ef0dc3707e8fc5

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
