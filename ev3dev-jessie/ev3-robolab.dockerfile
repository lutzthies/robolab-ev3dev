# adds functionality needed in the RoboLab classes

FROM ev3dev/test
COPY layers/robolab/ /
RUN
RUN chmod +x /brickstrap/robolab/run && /brickstrap/robolab/run
ARG BRICKSTRAP_IMAGE_NAME=unknown-ev3dev-jessie-ev3-generic
ENV BRICKSTRAP_IMAGE_NAME ${BRICKSTRAP_IMAGE_NAME}
RUN echo "$BRICKSTRAP_IMAGE_NAME" > /etc/ev3dev-release
