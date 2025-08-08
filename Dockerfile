FROM quay.io/fedora/fedora-bootc@sha256:68e0588acdd0dfadb4fda90fbe78773f1744c3798aec68d2b678b6f7d9920cd8

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
