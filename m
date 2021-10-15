From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 15 Oct 2021 14:44:58 +0100
Subject: [PATCH v2 0/5] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <20211015131925.22585-1-nikita.shubin@maquefel.me>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
Message-ID: <F1939182-5A3F-47A7-840B-442FAB28E7A5@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15 Oct 2021, at 14:19, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> 
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> This series introduce rebooting via i2c da9063 PMIC, currently on
> SiFive Unmatched board.
> 
> "gpio-poweroff" remains with default priority of 128 - default priority,
> da9063 is 1 by default the least priority.
> 
> da9063-reset {
> 	compatible = "da9063-reset";
> 	priority = <1>;
> };

I don?t see why priority is needed; the DA9063 is known to always be a
last-resort way to reboot. Just hard-code it as the lowest priority. I
also don?t see why we need a device tree node, just make it a platform
quirk, because this isn?t (and shouldn?t be) a standardised thing?
Definitely don?t want it being exposed to anything other than OpenSBI,
which is what ends up happening if it lives in the device tree...

Jess


