# Deploy WebPerformanceDashboard on KintoHub

This tutorial will show you how to deploy WebPerformanceDashboard on KintoHub.
The deployment will include
- A single node InfluxDB with no persistent disk and authentication disabled
- A single instance of Lighthouse
- A single instance of Grafana

**Note**
You will deploy `influxdb` from the KintoHub catalog.
Later, we will also add the kintoblocks from this tutorial in the catalog too.

## Overview

__About WebPerformanceDashboard__

Web performance dashboard powered by Lighthouse. [Learn More](https://github.com/greenido/webperf-dashboard/)

__About KintoHub__

KintoHub aligns teams to ship & operate cloud native apps with ease. [Learn More](https://www.kintohub.com)

## Repository

Fork the repository https://github.com/kintohub/webperf-dashboard.

**Note**
You will only use the `kinto` branch.

## Support

Contact us on [Discord](https://discordapp.com/invite/jqDHRxD)

## KintoBlock

Click **KintoBlocks** on the left menu.

### Lighthouse

1. Click **Create KintoBlock**
2. Choose [Website Block](https://docs.kintohub.com/docs/kintoblocks/websites)
3. Choose the repo you forked previously
4. Set the **Source Folder Path** to `/lighthouse` and click **Continue**
5. Set the **Name** (`lighthouse`?) and don't change the **Internal Name**
6. Choose **DynamicWeb app**
7. Choose `Custom Dockerfile` as the **language**
8. Set the **Port** as `3000` and click **Create Website**
9. Choose `KINTO` **Branch** on the left side and click **Build Latest Commit** (top right)
While your block is building
10. Click **SETTINGS** (top left)
11. Add **Environment Variable** `HOST`, enable **Required** and click **+**
12. Add **Environment Variable** `CRON`, enable **Required** and click **+**
13. Add **Environment Variable** `URLS`, enable **Required** and click **+**
14. Click **Save** (top right)

Wait for your build to be successful (green).

### Grafana

1. Click **Create KintoBlock**
2. Choose [Website Block](https://docs.kintohub.com/docs/kintoblocks/websites)
3. Choose the repo you forked previously
4. Set the **Source Folder Path** to `/grafana` and click **Continue**
5. Set the **Name** (`grafana-webperf`?) and don't change the **Internal Name**
6. Choose **DynamicWeb app**
7. Choose `Custom Dockerfile` as the **language**
8. Set the **Port** as `3000` and click **Create Website**
9. Choose `KINTO` **Branch** on the left side and click **Build Latest Commit** (top right)
While your block is building
10. Click **SETTINGS** (top left)
11. Add **Environment Variable** `GF_SECURITY_ADMIN_PASSWORD`, enable **Required** and click **+**
12. Add **Environment Variable** `GF_PANELS_DISABLE_SANITIZE_HTML`, set it to `true`, enable **Required** and click **+**
13. Add **Environment Variable** `INFLUX_URL`, enable **Required** and click **+**
14. Click **Save** (top right)

Wait for your build to be successful (green).

## Projects

Click **Projects** on the left menu.

### Configure InfluxDB

1. Click **Create Project**
2. Set the **Project Name** and don't change the **Internal Name**
3. Click **Add KintoBlocks...** searchbar, type `influx` and select it
4. Click on the cog icon (on the right)
5. Set **Environment Variable** `persistence.enabled` to `false`
6. Set **Environment Variable** `setDefaultUser.enabled` to `false`
7. Click on **Done Configuring** (top right)

### Configure Lighthouse

1. Click **Add KintoBlocks...** searchbar, type `lighthouse` (or the name of your lighthouse kintoblock you create previously) and select it
2. In the dropdown on the right, select `Kinto` branch (the only one with a build)
3. Click on the cog icon (on the right)
4. Set **Environment Variable** `HOST` to `influx`
5. Set **Environment Variable** `CRON` to the correct cronjob pattern (example: `0 */10 * * * *`)
6. Set **Environment Variable** `URLS` to one or more urls separated with a `,` (example: `https://www.kintohub.com,https://jfrog.com`)
7. Change the **MEMORY LIMIT** to `512MB` to make sure lighthouse have enough memory
8. Click on **Done Configuring** (top right)

### Configure Grafana

1. Click **Add KintoBlocks...** searchbar, type `grafana-webperf` (or the name of your lighthouse kintoblock you create previously) and select it
2. In the dropdown on the right, select `Kinto` branch (the only one with a build)
3. Click on the cog icon (on the right)
4. Set **Environment Variable** `INFLUX_URL` to `http://influx:8086` (or the right hostname from your previous deployment logs)
5. Set **Environment Variable** `GF_SECURITY_ADMIN_PASSWORD` to the password your wanna use to login to grafana (example: `K1nt0HuB`)
6. Click on **Done Configuring** (top right)

### Deploy

1.  Click on **Deploy** (bottom right)

Wait for your deployment to be successful (green).

## Access the dashboard

On your Project page (there should be only one environment `dev`).
In the **KintoBlock** list.

1. Click **Open** under `grafana-webperf` card.

**Note**

Username == `admin`



Here you go!
