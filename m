From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Fri, 15 Oct 2021 15:21:36 +0100
Subject: [PATCH v2 0/5] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <20211015170548.23b4b743@redslave.neermore.group>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <F1939182-5A3F-47A7-840B-442FAB28E7A5@jrtc27.com>
 <1372921634305615@mail.yandex.ru>
 <32095245-4C98-4C9E-9DAF-68167106A968@jrtc27.com>
 <20211015170548.23b4b743@redslave.neermore.group>
Message-ID: <C568A103-AD25-43C3-AEB9-578F370AC54F@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 15 Oct 2021, at 15:05, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> 
> On Fri, 15 Oct 2021 14:56:40 +0100
> Jessica Clarke <jrtc27@jrtc27.com> wrote:
> 
> Hello Jessica,
> 
>> The chip is common for RTC, power management and watchdog
>> functionality. Using it to reboot in this manner is not, as evidenced
>> by the fact that Linux does not have a driver for doing so and the
>> hardware vendor is unsure of how it?s even working the way it is. I
>> hope this driver is never needed for future RISC-V hardware (and I
>> don?t quite understand how it ended up being needed for the Unmatched,
>> when the Unleashed had a gpio-restart device, though that lacked a
>> gpio-poweroff I believe; seems like a very strange oversight).
>> 
>> Jess
>> 
> 
> Implementing SBC reset via Watchdog or PMIC is quite a common practice.

This sequence differs from the existing watchdog-based implementation
though, and to quote one of Dialog?s own engineers on LKML:

> Personally, if it was possible I think the RTC approach would be best as it's a
> full reset and to me is far safer with regards to potential side effects, but as
> that's not on the table then this seems the only other approach in your case.


This is why I am suggesting it not be a generic device tree thing, as
the vendor is basically saying it?s not a good option but the only
choice you have, so should be kept a quirk.

Jess


