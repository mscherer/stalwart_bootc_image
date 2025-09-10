FROM quay.io/fedora/fedora-bootc@sha256:d1d70e57ff04720b036be5a742729215fbc24b487b0807806f441bb375049135

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
