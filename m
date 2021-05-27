From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 27 May 2021 01:36:14 +0100
Subject: [PATCH v2 05/15] lib: sbi: Disable m/scounteren & enable
 mcountinhibit
In-Reply-To: <20210527003044.889681-6-atish.patra@wdc.com>
References: <20210527003044.889681-1-atish.patra@wdc.com>
 <20210527003044.889681-6-atish.patra@wdc.com>
Message-ID: <FD4B53F2-A813-49D8-AB08-A38BE3A6BF2C@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27 May 2021, at 01:30, Atish Patra <atish.patra@wdc.com> wrote:
> 
> Currently, all bits in mcountern are enabled unconditionally at
> boot time. With SBI PMU extension, this should enabled only during
> performance monitoring for a particular event except the TM bit. However,
> this is done only if mcountinhibit is implemented because the supervisor
> mode can not start/stop any event without mcountinhibit.
> 
> Similarly, supervisor should take care enabling scounteren which allows
> U-mode to access pmu counters. Disable all bits in scounteren in M-mode.

Turning off CY or IR seems like a bad idea to me. Similarly, all of CY, IR and
TM should be enabled in scounteren by default, this is just needlessly hostile.
IMO both mcounteren and scounteren should be initialised to 7 on boot.

Jess


