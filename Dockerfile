FROM eddelbuettel/r2u:22.04

RUN installGithub.r analythium/deps
RUN apt-get update && apt-get install -y --no-install-recommends jq

RUN addgroup --system app && adduser --system --ingroup app app
WORKDIR /home/app
COPY app .

RUN R -q -e "deps::create()"
# RUN apt-get install -y --no-install-recommends $( jq -r '.sysreqs | join(" ")' dependencies.json )
RUN R -q -e "deps::install()"

RUN chown app:app -R /home/app
USER app

EXPOSE 8080
CMD ["R", "-e", "shiny::runApp(port = 8080, host = '0.0.0.0')"]
