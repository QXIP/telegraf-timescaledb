# telegraf-timescaledb
Docker container running Telegraf 1.11.5 w/ [TimescaleDB](https://github.com/timescale/timescaledb) Postgres Extensions

### Usage
```
telegraf:
    image: sipcapture/telegraf-timescale
    restart: unless-stopped
    environment:
      - PGHOST=postgres
      - PGDATABASE=my_data
      - PGUSER=root
      - PGPASSWORD=password
    volumes:
      - ./conf/telegraf.conf:/etc/telegraf/telegraf.conf
    ports:
      - "8092:8092/udp"
      - "8125:8125/udp"
```
