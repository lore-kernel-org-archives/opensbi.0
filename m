From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Fri, 15 Oct 2021 17:05:48 +0300
Subject: [PATCH v2 0/5] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <32095245-4C98-4C9E-9DAF-68167106A968@jrtc27.com>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <F1939182-5A3F-47A7-840B-442FAB28E7A5@jrtc27.com>
 <1372921634305615@mail.yandex.ru>
 <32095245-4C98-4C9E-9DAF-68167106A968@jrtc27.com>
Message-ID: <20211015170548.23b4b743@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 15 Oct 2021 14:56:40 +0100
Jessica Clarke <jrtc27@jrtc27.com> wrote:

Hello Jessica,

> The chip is common for RTC, power management and watchdog
> functionality. Using it to reboot in this manner is not, as evidenced
> by the fact that Linux does not have a driver for doing so and the
> hardware vendor is unsure of how it?s even working the way it is. I
> hope this driver is never needed for future RISC-V hardware (and I
> don?t quite understand how it ended up being needed for the Unmatched,
> when the Unleashed had a gpio-restart device, though that lacked a
> gpio-poweroff I believe; seems like a very strange oversight).
> 
> Jess
> 

Implementing SBC reset via Watchdog or PMIC is quite a common practice.

