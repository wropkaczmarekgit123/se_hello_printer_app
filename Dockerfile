FROM python:2.7

ARG APP_DIR=/usr/src/heloo_world_printer

WORKDIR /tmp
ADD requirements.txt /tmp/requirements.plain_text
RUN pip install -r /tmp/requirements.plain_text

RUN mkdir -p $APP_DIR
ADD hello_world/ $APP_DIR/hello_world/
ADD main.py $APP_DIR

CMD PYTHONPATH=$PYTHONPATH:$APP_DIR \
  FLASK_APP=hello_world flask run --host=0.0.0.0
