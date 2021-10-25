From: Xiang W <wxjstz@126.com>
Date: Mon, 25 Oct 2021 15:04:08 +0800
Subject: [PATCH V2 0/2] lib: utils:/gpio: Improve the gpio driver
Message-ID: <20211025070410.1228846-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

---
These patches are used to fix some remaining issues

1. sifive code ignores gpio_pin.flags
2. Add ACTIVE_LOW processing code

v1 -> v2

1. Accepted some of Jess?s suggestions, moved the ACTIVE_LOW processing code forward to reduce the repetitive code of the driver
2. Add interface get_direction for sifive gpio driver
-- 
2.30.2


