From: Vagrant Cascadian <vagrant@reproducible-builds.org>
Date: Sun, 21 Nov 2021 11:20:02 -0800
Subject: [PATCH] reproducible builds: strip embedded file paths
In-Reply-To: <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
References: <874k89kl8o.fsf@ponder>
 <8607f8cc66989b754056f4396c16178bdc23c48a.camel@126.com>
Message-ID: <875ysl2u59.fsf@ponder>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-11-22, Xiang W. wrote:
> ? 2021-11-18???? 17:05 -0800?Vagrant Cascadian???
>> 
>> Unfortunately, the use of __FILE__ can embed the absolute build path
>> in
>> the resulting binary, resulting in different binaries depending on
>> which
>> path the build was performed in.
>
> Under what scenarios will absolute paths be embed.

In each of the directories below, I built using the same toolchain from
the same git commit...

$ cd /home/vagrant/src/opensbi/opensbi1
$ CROSS_COMPILE=riscv64-linux-gnu- make V=1 FW_PAYLOAD=n PLATFORM=generic
...
$ strings build/platform/generic/firmware/fw_dynamic.bin | grep /home/vagrant
/home/vagrant/src/opensbi/opensbi1/lib/sbi/riscv_asm.c

$ cd /home/vagrant/src/opensbi/opensbi2
$ CROSS_COMPILE=riscv64-linux-gnu- make V=1 FW_PAYLOAD=n PLATFORM=generic
...
$ strings build/platform/generic/firmware/fw_dynamic.bin | grep /home/vagrant
/home/vagrant/src/opensbi/opensbi2/lib/sbi/riscv_asm.c


With the patch applied:

$ cd /home/vagrant/src/opensbi/opensbi3
$ CROSS_COMPILE=riscv64-linux-gnu- make V=1 FW_PAYLOAD=n PLATFORM=generic
...
$ strings build/platform/generic/firmware/fw_dynamic.bin  | grep /home/vagrant
$ strings build/platform/generic/firmware/fw_dynamic.bin  | grep riscv_asm.c
./lib/sbi/riscv_asm.c

A relative path within the source should be sufficient for the debug
message to properly identify the relevent source files...


An alternate approach would be to not use __FILE__ at all, but that
would probably take more code than passing -ffile-prefix-map at compile
time.


Thanks!


live well,
  vagrant

