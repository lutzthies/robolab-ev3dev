# adds functionality needed in the RoboLab courses
FROM 7hal32/ev3dev-robolab-base

COPY layers/robolab/ /

RUN chmod +x /brickstrap/robolab/run /brickstrap/robolab/run.d/* \
    && chmod 711 /home/robot/.ssh /root/.ssh \
    && chmod 600 /home/robot/.ssh/* /root/.ssh/* \
    && /brickstrap/robolab/run

ARG BRICKSTRAP_IMAGE_NAME=unknown-ev3dev-jessie-ev3-generic

ENV BRICKSTRAP_IMAGE_NAME ${BRICKSTRAP_IMAGE_NAME}

RUN echo "$BRICKSTRAP_IMAGE_NAME" > /etc/ev3dev-release
