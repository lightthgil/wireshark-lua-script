0.将本目录下的lua文件放到 wireshark安装目录/plugins/版本号/  目录下（例如：C:\Program Files\Wireshark\plugins\2.4.6）  [本操作仅需要执行一次]
1.在设备上进行抓包
	抓包通过C函数实现。
	add函数添加抓包功能
	start函数开始抓包
	stop函数停止抓包
	remove函数删除抓包功能，删除抓到的包，释放资源
	1) 主控抓包方法：
		方法一：进入6000端口，使用debug  函数名 调用
		方法二:进入3333端口，使用necli.0.CmdEx "DbgCmdEx",{{String,"函数名()"}} 调用
		
		目前主控实现的抓包功能如下：
		//BCM提到CPU的所有报文
		debug AddStackSwitchBcmRxHandleCapturePacket
		debug startStackSwitchBcmRxHandleCapturePacket
		debug stopStackSwitchBcmRxHandleCapturePacket
		debug RemoveStackSwitchBcmRxHandleCapturePacket
		//其他盘发往主控的所有快速以太报文	
		debug AddOpctPtpv3PhyEth2PpcCapturePacket
		debug startOpctPtpv3PhyEth2PpcCapturePacket
		debug stopOpctPtpv3PhyEth2PpcCapturePacket
		debug RemoveOpctPtpv3PhyEth2PpcCapturePacket
		//其他盘发往主控的PTP快速以太报文抛job处理	
		debug AddOpctPtpv3PhyJobEth2PpcCapturePacket
		debug startOpctPtpv3PhyJobEth2PpcCapturePacket
		debug stopOpctPtpv3PhyJobEth2PpcCapturePacket
		debug RemoveOpctPtpv3PhyJobEth2PpcCapturePacket
		//BCM到主控板的PTP报文
		debug AddOpctPtpv3PhyPtpPpc2EthCapturePacket
		debug startOpctPtpv3PhyPpc2EthCapturePacket
		debug stopOpctPtpv3PhyPpc2EthCapturePacket
		debug RemoveOpctPtpv3PhyPpc2EthCapturePacket
		//BCM到主控板的PTP报文抛job处理
		debug AddOpctPtpv3PhyJobPpc2EthCapturePacket
		debug startOpctPtpv3PhyJobPpc2EthCapturePacket
		debug stopOpctPtpv3PhyJobPpc2EthCapturePacket
		debug RemoveOpctPtpv3PhyJobPpc2EthCapturePacket
		//主控发送的PTP快速以太报文
		debug AddOpctPtpv3PhyEthMsgOutputCapturePacket
		debug startOpctPtpv3PhyEthMsgOutputCapturePacket
		debug stopOpctPtpv3PhyEthMsgOutputCapturePacket
		debug RemoveOpctPtpv3PhyPtpEthMsgOutputCapturePacket
	2）业务盘抓包方法：
		进入23端口，直接使用  函数名 调用
		
		目前业务盘实现的抓包功能如下：
		//业务板PTP模块收包报文后存储的状况
		AddCardPtpv3PhyStoreCapturePacket
		startCardPtpv3PhyStoreCapturePacket
		stopCardPtpv3PhyStoreCapturePacket
		RemoveCardPtpv3PhyStoreCapturePacket
		//业务板PTP协议栈去获取存储在phy层的报文
		AddCardPtpv3PhyProtolGetCapturePacket
		startCardPtpv3PhyProtolGetCapturePacket
		stopCardPtpv3PhyProtolGetCapturePacket
		RemoveCardPtpv3PhyProtolGetCapturePacket
		//业务板收到其他板卡发送过来的所有快速以太报文
		AddCardPtpv3PhyPtpEtherInputCapturePacket
		startCardPtpv3PhyPtpEtherInputCapturePacket
		stopCardPtpv3PhyPtpEtherInputCapturePacket
		RemoveCardPtpv3PhyPtpEtherInputCapturePacket
		//业务板收到其他板卡发送过来的PTP快速以太报文之后的抛job处理
		AddCardPtpv3PhyJobPtpEtherInputCapturePacket
		startCardPtpv3PhyJobPtpEtherInputCapturePacket
		stopCardPtpv3PhyJobPtpEtherInputCapturePacket
		RemoveCardPtpv3PhyPtpJobPtpEtherInputCapturePacket
		//业务板发送的PTP快速以太报文
		AddCardPtpv3PhyEthMsgOutputCapturePacket
		startCardPtpv3PhyEthMsgOutputCapturePacket
		stopCardPtpv3PhyEthMsgOutputCapturePacket
		RemoveCardPtpv3PhyPtpEthMsgOutputCapturePacket		
2.将抓到的包导出到电脑
	1）主控取包方法
		a. 抓包文件放在/tmpfs0/ramdisk:0/ 目录下
		b. 可以通过FTP软件直接将抓包文件取到电脑
	2）单盘的取包方法
		a. 抓包文件放在/ramdisk:0/ 目录下
		b. 进入到单盘的23端口
		c. 通过命令ll "/ramdisk:0"查看生产的抓包文件
		d. 通过命令bsp_ftp_put_file "192.168.210.6","weihu","cjhyy300","/ramdisk:0/文件名","/ramdisk:0/文件名"将抓包文件发送到主控的/ramdisk:0/ 目录下
		f. 通过FTP软件从主控/ramdisk:0/目录下的将转包文件取到电脑		
3.使用wireshark打开抓到的包进行解析
	如果解析失败，请查看步骤0是否执行成功。
	如果步骤0执行成功但还是解析失败，请自行添加对应的解包文件lua