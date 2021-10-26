From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Tue, 26 Oct 2021 17:30:24 +0300
Subject: [PATCH v2 0/5] I2C framework, reboot Unmatched via PMIC
In-Reply-To: <CA+zEjCubCEaVxYif-3JWgyrb5E7yecS8_CaHou0LfiKP_5toFA@mail.gmail.com>
References: <20211015131925.22585-1-nikita.shubin@maquefel.me>
 <CA+zEjCuiEH0YRTztbo5MiV+6mP-Aivuot9gsPKYNyvypeiT80Q@mail.gmail.com>
 <20211020091720.2ab43230@redslave.neermore.group>
 <CA+zEjCubCEaVxYif-3JWgyrb5E7yecS8_CaHou0LfiKP_5toFA@mail.gmail.com>
Message-ID: <20211026173024.63b9b4f2@redslave.neermore.group>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Alexandre!

On Tue, 26 Oct 2021 08:34:17 +0200
Alexandre Ghiti <alexandre.ghiti@canonical.com> wrote:

> 
> That's weird, it still does not work for me from u-boot with the
> following:
> 
> - openSBI:
> https://github.com/AlexGhiti/opensbi/tree/int/alex/nikita_pmic_reset_v2
> - u-boot:
> https://github.com/maquefel/u-boot/tree/yadro/riscv/unmatched-v2021.07
> 
> And this fails this way:
> 
> => reset  
> resetting ...
> da9063_system_reset: chip is not da9063 PMIC
> 

Thank you for testing once again!

I'll try to hug the board and don't release it until i conduct some
experiments.

Currently i am fighting the RTC, to find out if it is usable:

In short i get one and only one ALARM interrupt, and no further
interrupts:

https://forums.sifive.com/t/has-anyone-got-da9063-rtc-working-from-linux/5302

And currently trying to find out if reset is related to this somehow...
 


