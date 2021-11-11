From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Thu, 11 Nov 2021 15:22:32 +0000
Subject: [PATCH v4 3/6] lib: utils/i2c: Add generic I2C configuration
 library
In-Reply-To: <ca0fe6b1cc327ac65db2084f34810c59af9e05f7.camel@126.com>
References: <20211110094230.5243-1-nikita.shubin@maquefel.me>
 <20211110094230.5243-4-nikita.shubin@maquefel.me>
 <8bef823514bd1af5dbdd9bf4904d79c215ba7f0a.camel@126.com>
 <CAAhSdy2rA4tsQa6Bi_FkrMwMs9CifK=QSGJVmySkvY9y0X2GPA@mail.gmail.com>
 <6c574a3b279871aa85ee8be5da129f5974cb0039.camel@126.com>
 <b0ab570a15162294189673875445a5102f7b1d30.camel@126.com>
 <CAAhSdy0YOXNrUZ-RoiV-fvcFOU3j+MxKenh_ntKdepxRN0St0A@mail.gmail.com>
 <ca0fe6b1cc327ac65db2084f34810c59af9e05f7.camel@126.com>
Message-ID: <175546F5-6393-482A-8C3F-5BAF129A253D@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11 Nov 2021, at 15:09, Xiang W <wxjstz@126.com> wrote:
> 
> ? 2021-11-11???? 11:46 +0530?Anup Patel???
>> On Thu, Nov 11, 2021 at 10:48 AM Xiang W <wxjstz@126.com> wrote:
>>> 
>>> ? 2021-11-11???? 13:12 +0800?Xiang W???
>>>> ? 2021-11-10???? 22:30 +0530?Anup Patel???
>>>>> On Wed, Nov 10, 2021 at 6:32 PM Xiang W <wxjstz@126.com> wrote:
>>>>>> 
>>>>>> ? 2021-11-10???? 12:42 +0300?Nikita Shubin???
>>>>>>> From: Nikita Shubin <n.shubin@yadro.com>
>>>>>>> 
>>>>>>> Helper library to keep track of registered I2C adapters,
>>>>>>> identified by dts offset, basic send/read functions and
>>>>>>> adapter configuration (enable, set dividers, etc...).
>>>>>>> 
>>>>>>> Tested-by: Heinrich Schuchardt
>>>>>>> <heinrich.schuchardt@canonical.com>
>>>>>>> Reviewed-by: Alexandre Ghiti
>>>>>>> <alexandre.ghiti@canonical.com>
>>>>>>> Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>>>>>>> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
>>>>>> The i2c bus does not define register-related operations,
>>>>>> these
>>>>>> interfaces should be renamed smbus
>>>>> 
>>>>> I disagree with this suggestion, the existing read/write
>>>>> interface
>>>>> names are generic enough to send/receive an array of bytes.
>>>>> These are also suitable for reading EEPROMs or DDR SPD
>>>>> data, etc. I don't see why we should explicitly name it SMBUS
>>>>> and restrict it's use.
>>>> IIC is a particularly flexible bus. The standard only defines how
>>>> to
>>>> address the device, but does not define how to access the
>>>> registers
>>>> in
>>>> the device. How to operate a device is defined by the device's
>>>> data
>>>> sheet.
>>>> 
>>>> For example: 24LC64 EEPROM random read process
>>>> S: Start signal
>>>> Addr(7bit): address
>>>> R/W (1bit): read and write control signal
>>>> A/NA(1bit): Acknowledge signal
>>>> Data(8bit): data
>>>> P: STOP signal
>>>> []: Indicates that data is transferred from the device to the
>>>> host
>>>> 
>>>> S Addr R [A] Data [A] Data [A] S Addr R [Data] NA P
>>> The previous line is wrong, it should look like this
>>> 
>>> S Addr W [A] Data [A] Data [A] S Addr R [Data] NA P
>> 
>> I see your concern about "uint_8 reg" parameter.
>> 
>> I think this can be broken down into two parameters "uint8_t *cmd"
>> and "int cmd_len" but this can be done as separate patch.
>> 
>> Regards,
>> Anup
> 
> This is not enough
> 
> i2c defines three transmission modes
> 1. Read: Read data from the device
> 2. Write: Write data to the device
> 3. Combined operation. This is the lack of a STOP signal between two
> consecutive read and write operations. Both operations can be read or
> write, and the data length is not fixed.
> 
> You can refer to: https://www.pololu.com/file/0J435/UM10204.pdf
> 
> I suggest changing the interface to this:
> 
> int i2c_adapter_read(struct i2c_adapter *ia, 
> 	unsigned addr, unsigned addrlen, 
> 	unsigned count, uint8_t *buff);
> int i2c_adapter_write(struct i2c_adapter *ia,
> 	unsigned addr, unsigned addrlen, 
> 	unsigned count, uint8_t *buff);
> int i2c_adapter_combined_trans(struct i2c_adapter *ia, 
> 	unsigned addr, unsigned addrlen, 
> 	unsigned rw0, unsigned c0, uint8_t *b0,
> 	unsigned rw1, unsigned c1, uint8_t *b1);
> 
> i2c_adapter_smbus_xxx

SMBus should be a generic wrapper around an I2C controller interface;
once you have the I2C operations there is nothing controller-dependent
about it. Or, really I2CSMBus; you can get SMBus controllers that don?t
expose raw I2C (well, most kinda do if you configure them right).

Jess


