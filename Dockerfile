FROM quay.io/fedora/fedora-bootc@sha256:42983ec7e3b625f8182ee0e275b0cbd0ab95aafd97374f95afbaacc8452267ef

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
