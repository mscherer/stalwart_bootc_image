FROM quay.io/fedora/fedora-bootc@sha256:fd24bdb4a4d1acbf787912aec772a466e8c39bcbbda9cec9b82753e802fe40c1

#
# empty space for easier rebasing
#

COPY stalwart.quadlet /etc/systemd/system/stalwart.service 
RUN bootc container lint --fatal-warnings 
