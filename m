From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Oct 2021 13:40:19 +0200
Subject: [PATCH v5] Makefile: Add build time and compiler info string
In-Reply-To: <CAEUhbmVTNMp2Y5CCJNZZH4ph5tmBST5hkP6e+Xg8Cb9Sjxqt6g@mail.gmail.com>
 (Bin Meng's message of "Mon, 18 Oct 2021 18:33:59 +0800")
References: <20211018041148.1343731-1-anup.patel@wdc.com>
 <CAEUhbmWt9sPua3iQhJxBR0UzDPGDyHJK7BOZv15g5qT5+Z6OXQ@mail.gmail.com>
 <CAAhSdy25Fp1pY0utamEd9sUfkPBhdBq3k8Rm61mdwayw-09bzQ@mail.gmail.com>
 <CAEUhbmXnpJCH9z8XoyG14s7YJ7L4wiKj--Z1YU1UgFz4J8irmQ@mail.gmail.com>
 <87h7dehj56.fsf@igel.home>
 <CAEUhbmV1PRz=h2B+uH6Vmnb9zsAdku6zH7KPp4iotLFsjWRkCQ@mail.gmail.com>
 <CAAhSdy1GSg34u3eGc5CQCuV+TuEXVj9aVHs12pUkDWt9r+N4HA@mail.gmail.com>
 <CAEUhbmW=+N4d2NJUedgLi1n=4j6sXHTeLTb2xn5w1-K=mrRA5Q@mail.gmail.com>
 <CAAhSdy10-JHm5vPOtZtmYS5ASR+dhvG=uWi7pARunENONP6xEQ@mail.gmail.com>
 <CAEUhbmVTNMp2Y5CCJNZZH4ph5tmBST5hkP6e+Xg8Cb9Sjxqt6g@mail.gmail.com>
Message-ID: <87lf2qef30.fsf@dell.be.48ers.dk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Bin" == Bin Meng <bmeng.cn@gmail.com> writes:

Hi,

 >> Users will have to figure-out/remember a fixed build date when
 >> using SOURCE_DATA_EPOCH for reproducible builds whereas
 >> users don't need to do anything when BUILD_INFO is not defined.

 > This is not 100% true as with current OpenSBI we never claim its build
 > is fully reproducible. For example, one can easily add __DATE__ to the
 > source codes which will alter unless we provide SOURCE_DATA_EPOCH.

Notice that GCC >= 7 does in fact look for SOURCE_DATE_EPOCH in the
environment and change the behaviour of the __DATE__ / __TIME__ macros:

https://gcc.gnu.org/onlinedocs/cpp/Environment-Variables.html

-- 
Bye, Peter Korsgaard

