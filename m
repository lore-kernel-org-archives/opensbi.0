From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 21 Feb 2023 12:22:53 -0800
Subject: [PATCH 1/1] Add RISC-V TEE support
In-Reply-To: <007e01d941fb$7ef6f1d0$7ce4d570$@eswincomputing.com>
References: <007e01d941fb$7ef6f1d0$7ce4d570$@eswincomputing.com>
Message-ID: <CAOnJCULgCiQY4+VvmL1zsxdg6utcKt_piE33S7FdXYorVWkkrg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 16, 2023 at 3:40 AM liushiwei <liushiwei@eswincomputing.com> wrote:
>
> Hi? Atish
>         I tried to email tech-prs at lists.riscv.org and sig-trusted-computing at lists.riscv.org, but both returned. My attempts to send a patch directly also returned.
>         Looking at this reason, does it seem like I have to join some group before I can send an email?
>
> ?Connection to the remote recipient's server was denied for unknown reason.
> SMTP through SDN 37, SMTP: (Proxy)Host lists.riscv.org said 510 5.1.1 Your email address, liushiwei at eswincomputing.com,
> is not subscribed to that group.  To subscribe, send an email to sig-trusted-computing+subscribe at lists.riscv.org,
> or visit https://lists.riscv.org/g/sig-trusted-computing?
>

Yes. You have to subscribe to each group. Either you can join as an
individual member or your organization if that's already a RVI member.

> Regards,
> Liushiwei
> -----????-----
> ???: Atish Patra [mailto:atishp at atishpatra.org]
> ????: 2023?2?8? 6:37
> ???: liushiwei <liushiwei@eswincomputing.com>
> ??: Himanshu Chauhan <hchauhan@ventanamicro.com>; opensbi at lists.infradead.org; chenchaokai at eswincomputing.com
> ??: Re: Re: [PATCH 1/1] Add RISC-V TEE support
>
> On Sat, Jan 28, 2023 at 12:33 AM liushiwei <liushiwei@eswincomputing.com> wrote:
> >
> > Hi, Atish
> >         Thank you for your reply.
> >         I submitted my ideas to https://github.com/riscv-non-isa/riscv-sbi-doc/pull/106 as requested by other members of the email.
> >         You can preview them at https://github.com/liushiwei007/riscv-sbi-doc/blob/master/riscv-sbi.adoc .
> >         I'm not sure if I need to send an email to tech-prs at lists.riscv.org or sig-trusted-computing at lists.riscv.org after submitting to riscv-sbi-doc?
> >         If so, Is it to send the patch of opensbi I submitted before?
> >
>
> The Trusted computing SIG evaluates the overall merit and direction of any TEE related specifications.
> The PRS TG will focus more on the SBI specification related parts.
> I would recommend you to present your work to Trusted Computing SIG first so that everybody agrees on the overall direction for OP-TEE support in RISC-V.
>
> > Regards,
> > Liushiwei
> >
> >
> > -----????-----
> > ???: Atish Patra [mailto:atishp at atishpatra.org]
> > ????: 2023?1?25? 3:12
> > ???: liushiwei <liushiwei@eswincomputing.com>
> > ??: Himanshu Chauhan <hchauhan@ventanamicro.com>;
> > opensbi at lists.infradead.org; chenchaokai at eswincomputing.com
> > ??: Re: ??: [PATCH 1/1] Add RISC-V TEE support
> >
> > On Wed, Jan 11, 2023 at 11:08 PM liushiwei <liushiwei@eswincomputing.com> wrote:
> > >
> > > Hi, Himanshu ,  These are my description:
> > >
> > > In my design, The entire linux space is called REE (Rich Execution
> > > Environment), and TEE OS includes its user state called TEE (Trusted execution environment).
> > > adding TEE functionality to opensbi requires two configuration items.
> > > For example:
> > >    add CONFIG_SBI_ECALL_TEE=y in platform/generic/configs/defconfig file.
> > >    add CONFIG_TEE_LOAD_ADDR=0x27C000000 platform/generic/objects.mk.
> > >    The value of CONFIG_TEE_LOAD_ADDR depends on the actual memory layout,
> > >    It's a physical address.
> > >
> > > When TEE is configured, opensbi adds the following functionality:
> > > 1. Boot TEE OS.
> > >    If TEE is enabled, tee_os_init() is called before entering
> > >    sbi_hart_switch_mode(). tee_os_init saves the current context,
> > >    sets a new trap stack address, and runs to CONFIG_TEE_LOAD_ADDR as configured
> > >    to complete TEE OS initialization. TEE OS returns via ecall, Go to opensbi
> > >    sbi_ecall_tee_handler and use the characteristic value RETURN_ENTRY_DONE
> > >    to indicate the return after the TEE OS completes booting. Check whether the
> > >    TEE OS boot successfully according to the parameter. If fails,
> > >    the system enters wfi and terminates the startup process of opensbi. If successful,
> > >    it returns REE to switch into TEE's vector. then trap stack memory is restored,
> > >    the context is restored, the tee_os_init call is returned,
> > >    and the rest of the process is performed.
> > > 2. REE switches to TEE.
> > >    When the TEE OS boot successfully, it returns an entry vector for REE into the TEE.
> > >    It represents various entry points into TEE OS and is stored in opensbi's global variables.
> > >    It is the optee_vectors_t structure, which contains nine entry cases:
> > >       1. yield_smc_entry;
> > >       2. fast_smc_entry;
> > >       3. cpu_on_entry;
> > >       4. cpu_off_entry;
> > >       5. cpu_resume_entry;
> > >       6. cpu_suspend_entry;
> > >       7. fiq_entry;
> > >       8. system_off_entry;
> > >       9. system_reset_entry;
> > >    yield_smc_entry means that this function entry TEE will start the thread function
> > >    and enter the user state of TEE. It may also switch back to REE with RPC function,
> > >    and then return to TEE after REE completes the corresponding function.
> > >    For the REE process that sent you this call, it may cause sleep.
> > >
> > >    fast_smc_entry indicates that this is a quick function that returns after
> > >    the TEE OS does something, and that it does not cause the caller to sleep.
> > >
> > >    yield_smc_entry and fast_smc_entry return opensbi use eigenvalue RETURN_CALL_DONE.
> > >    for yield_smc_entry, whether the call returns or the RPC returns is decided by linux.
> > >
> > >    cpu_on_entry/cpu_off_entry/cpu_resume_entry/cpu_suspend_entry and
> > >    fiq_entry/system_off_entry/system_reset_entry they are not implemented currently.
> > >
> > > 3. TEE switches to REE.
> > >    opensbi needs to save the context when REE enters the TEE,
> > >    and restore the context when it returns from the TEE.
> > >
> > > 4. TEE/REE Request a special function.
> > >    We have some specific functions, like get hartid from TEE,
> > >    it need save and restore the TEE context.
> > >
> > > Data structure.
> > > opensbi adds the sbi_save_context declaration
> > >    struct sbi_save_context {
> > >       struct sbi_trap_regs regs;
> > >       unsigned long sepc;
> > >       unsigned long satp;
> > >       unsigned long sstatus;
> > >       unsigned long sie;
> > >       unsigned long stvec;
> > >       unsigned long sscratch;
> > >       unsigned long scounteren;
> > >       unsigned long scause;
> > >       unsigned long stval;
> > >       unsigned long sip;
> > >    };
> > >    sbi_save_context include sbi_trap_regs and S mode csr. Used to
> > > hold the context of TEE or REE
> > >
> > >    typedef struct optee_vectors {
> > >       optee_vector_isn_t yield_smc_entry;
> > >       optee_vector_isn_t fast_smc_entry;
> > >       optee_vector_isn_t cpu_on_entry;
> > >       optee_vector_isn_t cpu_off_entry;
> > >       optee_vector_isn_t cpu_resume_entry;
> > >       optee_vector_isn_t cpu_suspend_entry;
> > >       optee_vector_isn_t fiq_entry;
> > >       optee_vector_isn_t system_off_entry;
> > >       optee_vector_isn_t system_reset_entry;
> > >    } optee_vectors_t;
> > >    optee_vectors represent the various entry points into TEE OS.
> > >
> > > Variables defined by opensbi
> > >    optee_vectors_t *optee_vector_table;
> > >    struct sbi_save_context nsec_cpu_context[OPTEED_CORE_COUNT];
> > >    struct sbi_save_context sec_cpu_context[OPTEED_CORE_COUNT];
> > >    struct sbi_trap_regs cpu_start_context[OPTEED_CORE_COUNT];
> > >    typedef ulong tee_tmp_trap_stack[1024];
> > >    static tee_tmp_trap_stack tmp_stack[OPTEED_CORE_COUNT];
> > >
> > >    optee_vector_table value is assigned after the TEE OS boot succeeds.
> > >    nsec_cpu_context and sec_cpu_context is to save the context of TEE and REE,
> > >    cpu_start_context save the context of opensbi before tee_os_init enter TEE OS,
> > >    tee_tmp_stack is the trap stack when TEE OS return tee_os_init.
> > >
> > > Under the current design, REE does not enable interrupts when
> > > entering TEE, and the entire TEE, including opensbi, is the process context of linux.
> > > TEE processing must be brief and quick.
> > >
> >
> > Great. Thanks. Your PR should include more details like this with proper FID allocation and description.
> > In order to make it a standard RISC-V SBI extension, you need to
> > present this in tech-prs mailing list
> > (https://lists.riscv.org/g/tech-prs)
> > and get it approved within the group. Here is the policy document[1]
> >
> > https://docs.google.com/document/d/1bQGHU-wD4uN4mU07oH9adpXbH51NqUbFxc
> > L8qTTIqhA/edit
> >
> > I think it would be good if you can present your work in trusted computing SIG (https://lists.riscv.org/g/sig-trusted-computing) as well.
> >
> > >
> > > Regards,
> > > liushiwei
> > > -----????-----
> > > ???: Himanshu Chauhan [mailto:hchauhan at ventanamicro.com]
> > > ????: 2023?1?11? 23:39
> > > ???: liushiwei <liushiwei@eswincomputing.com>
> > > ??: opensbi at lists.infradead.org; chenchaokai at eswincomputing.com
> > > ??: Re: ??: [PATCH 1/1] Add RISC-V TEE support
> > >
> > > On Wed, Jan 11, 2023 at 08:27:59PM +0800, liushiwei wrote:
> > > > Do you mean hardware? Our hardware design referred to arm's
> > > > trustzone technology. optee os is a software solution using arm
> > > > trustzone hardware, which mainly includes REE(linux), TEE(optee
> > > > os), ATF(ARM Trusted firmware), and then our software also
> > > > developed these three parts. opensbi is similar to ATF. whether if this is what you want?
> > > > The current committed code is not hardware-dependent, but just
> > > > continues the idea of this workaround, and we may commit hardware-dependent code later.
> > > >
> > > No, I meant the software specification.
> > >
> > > > -----????-----
> > > > ???: hchauhan at ventanamicro.com [mailto:hchauhan at ventanamicro.com]
> > > > ????: 2023?1?11? 20:03
> > > > ???: 'liushiwei' <liushiwei@eswincomputing.com>; opensbi at lists.infradead.
> > > > org
> > > > ??: chenchaokai at eswincomputing.com
> > > > ??: RE: [PATCH 1/1] Add RISC-V TEE support
> > > >
> > > > -----Original Message-----
> > > > > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> > > > > liushiwei
> > > > > Sent: 11 January 2023 07:32
> > > > > To: opensbi at lists.infradead.org
> > > > > Cc: chenchaokai at eswincomputing.com; liushiwei
> > > > <liushiwei@eswincomputing.com>
> > > > > Subject: [PATCH 1/1] Add RISC-V TEE support
> > > >
> > > > >RISC-V Trusted Executable Environment security software includes
> > > > >linux,
> > > > opensbi, and OP-TEE OS. linux is the non-secure domain, and OP-TEE
> > > > OS is the secure domain. At boot time, opensbi boots OP->TEE OS and then starts linux.
> > > > At runtime, opensbi acts as a secure monitor, responsible for
> > > > context saving and restoring when switching between linux and OP-TEE OS.
> > > > >TEE function is off by default, when using configuration is added
> > > > >in the
> > > > config and objects file, such as
> > > > platform/generic/configs/defconfig
> > > > add CONFIG_SBI_ECALL_TEE = y, In the >platform/generic/objects.mk
> > > > add CONFIG_TEE_LOAD_ADDR = 0x27c000000, CONFIG_TEE_LOAD_ADDR is
> > > > the starting address of the OP-TEE OS.
> > > >
> > > > Hi Liushiwei,
> > > >
> > > > Was there any formal specification or draft for this? Could you
> > > > please point me to the draft or specification?
> > > >
> > > > Regards
> > > > Himanshu
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > > >
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> >
> >
> > --
> > Regards,
> > Atish
> >
>
>
> --
> Regards,
> Atish
>


-- 
Regards,
Atish

