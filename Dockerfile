FROM quay.io/fedora/fedora-bootc@sha256:09fc42f1db6487dd47b773a852672d3a6977753ad8e8fb02a2b490af8cb6bf2d

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
