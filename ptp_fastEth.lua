do

--[[  
        创建一个新的协议结构 PtpSendPtpPktAsk  
        第一个参数是协议名称会体现在过滤器中  
        第二个参数是协议的描述信息，无关紧要  
    --]]  
    local PtpSendPtpPktAsk = Proto("SendPtpV3Pkt", "SendPtpV3Pkt")  
	
	--解析PtpSendPtpPktAsk_send_flag值代表的含义
	local PtpSendPtpPktAsk_send_flag_Em = {
		[0] = "L2 packet",
		[1] = "L3 TC packet",
		[2] = "L3 BC OC Unicast",
		[3] = "L3 BC OC TC Multicast",
	}
      
    --[[  
        下面定义字段  
    --]]  
    local PtpSendPtpPktAsk_len = ProtoField.uint16("PtpSendPtpPktAsk.msglen", "PTP Message Length", base.DEC)  
	local PtpSendPtpPktAsk_channel_index = ProtoField.uint16("PtpSendPtpPktAsk.channelIndex", "ChannelIndex", base.DEC)
	local PtpSendPtpPktAsk_slot = ProtoField.uint32("PtpSendPtpPktAsk.slot", "Souce Slot", base.DEC)
    local PtpSendPtpPktAsk_send_flag = ProtoField.uint8("PtpSendPtpPktAsk.sendFlag", "Send Flag", base.DEC, PtpSendPtpPktAsk_send_flag_Em)
	local PtpSendPtpPktAsk_ps_pAddr = ProtoField.ipv4("PtpSendPtpPktAsk.ps_pAddr", "Peer Ip", base.IPv4)  
	local PtpSendPtpPktAsk_pad = ProtoField.string("PtpSendPtpPktAsk.pad", "Padding", base.NONE)  
      
  -- -- 将字段添加到协议中  
    PtpSendPtpPktAsk.fields = { 
		PtpSendPtpPktAsk_len,
		PtpSendPtpPktAsk_channel_index,
		PtpSendPtpPktAsk_slot,
		PtpSendPtpPktAsk_send_flag,
		PtpSendPtpPktAsk_ps_pAddr,
		PtpSendPtpPktAsk_pad
    }
	
	IfIndexBitFiled_Equipment_Em = {
		[0] = "first NE",
		[1] = "second NE"
	}
	
	IfIndexBitFiled_Control_Em = {
		[0] = "接口处理合一, card index = slot index",
		[1] = "接口卡, card index = slot index",
		[2] = "处理卡, card index 1 = 对应的接口卡的slot index",
		[3] = "保护卡, card index 2 = 对应的处理卡的slot index"
	}
	
	IfIndexBitFiled_PortType_Vlan_Em = {
		[0] = "with vlan",
		[1] = "without vlan"
	}
	
	IfIndexBitFiled_PortType_Aggregation_Em = {
		[0] = "No Aggregation",
		[1] = "Link Aggregation"
	}
	
	IfIndexBitFiled_PortType_Location_Em = {
		[0] = "external",
		[1] = "internal"
	}
	
	IfIndexBitFiled_PortType_Layer_Em = {
		[0] = "L2",
		[1] = "L3"
	}
	
	Num_Em = {
		[0]="1",[1]="2",[2]="3",[3]="4",[4]="5",[5]="6",[6]="7",[7]="8",[8]="9",[9]="10",[10]="11",[11]="12",[12]="13",[13]="14",[14]="15",[15]="16",[16]="17",[17]="18",[18]="19",[19]="20",[20]="21",[21]="22",[22]="23",[23]="24",[24]="25",[25]="26",[26]="27",[27]="28",[28]="29",[29]="30",[30]="31",[31]="32",[32]="33",[33]="34",[34]="35",[35]="36",[36]="37",[37]="38",[38]="39",[39]="40",[40]="41",[41]="42",[42]="43",[43]="44",[44]="45",[45]="46",[46]="47",[47]="48",[48]="49",[49]="50",[50]="51",[51]="52",[52]="53",[53]="54",[54]="55",[55]="56",[56]="57",[57]="58",[58]="59",[59]="60",[60]="61",[61]="62",[62]="63",[63]="64",[64]="65",[65]="66",[66]="67",[67]="68",[68]="69",[69]="70",[70]="71",[71]="72",[72]="73",[73]="74",[74]="75",[75]="76",[76]="77",[77]="78",[78]="79",[79]="80",[80]="81",[81]="82",[82]="83",[83]="84",[84]="85",[85]="86",[86]="87",[87]="88",[88]="89",[89]="90",[90]="91",[91]="92",[92]="93",[93]="94",[94]="95",[95]="96",[96]="97",[97]="98",[98]="99",[99]="100",[100]="101",[101]="102",[102]="103",[103]="104",[104]="105",[105]="106",[106]="107",[107]="108",[108]="109",[109]="110",[110]="111",[111]="112",[112]="113",[113]="114",[114]="115",[115]="116",[116]="117",[117]="118",[118]="119",[119]="120",[120]="121",[121]="122",[122]="123",[123]="124",[124]="125",[125]="126",[126]="127",[127]="128",[128]="129",[129]="130",[130]="131",[131]="132",[132]="133",[133]="134",[134]="135",[135]="136",[136]="137",[137]="138",[138]="139",[139]="140",[140]="141",[141]="142",[142]="143",[143]="144",[144]="145",[145]="146",[146]="147",[147]="148",[148]="149",[149]="150",[150]="151",[151]="152",[152]="153",[153]="154",[154]="155",[155]="156",[156]="157",[157]="158",[158]="159",[159]="160",[160]="161",[161]="162",[162]="163",[163]="164",[164]="165",[165]="166",[166]="167",[167]="168",[168]="169",[169]="170",[170]="171",[171]="172",[172]="173",[173]="174",[174]="175",[175]="176",[176]="177",[177]="178",[178]="179",[179]="180",[180]="181",[181]="182",[182]="183",[183]="184",[184]="185",[185]="186",[186]="187",[187]="188",[188]="189",[189]="190",[190]="191",[191]="192",[192]="193",[193]="194",[194]="195",[195]="196",[196]="197",[197]="198",[198]="199",[199]="200",[200]="201",[201]="202",[202]="203",[203]="204",[204]="205",[205]="206",[206]="207",[207]="208",[208]="209",[209]="210",[210]="211",[211]="212",[212]="213",[213]="214",[214]="215",[215]="216",[216]="217",[217]="218",[218]="219",[219]="220",[220]="221",[221]="222",[222]="223",[223]="224",[224]="225",[225]="226",[226]="227",[227]="228",[228]="229",[229]="230",[230]="231",[231]="232",[232]="233",[233]="234",[234]="235",[235]="236",[236]="237",[237]="238",[238]="239",[239]="240",[240]="241",[241]="242",[242]="243",[243]="244",[244]="245",[245]="246",[246]="247",[247]="248",[248]="249",[249]="250",[250]="251",[251]="252",[252]="253",[253]="254",[254]="255",[255]="256"
	}
	
	local IfIndexBitFiled_Equipment = ProtoField.uint32("IfIndexBitFiled.Equipment", "Equipment", base.DEC, IfIndexBitFiled_Equipment_Em, 0x80000000)
	local IfIndexBitFiled_Control  = ProtoField.uint32("IfIndexBitFiled.Control", "Control", base.DEC, IfIndexBitFiled_Control_Em, 0x60000000)
	local IfIndexBitFiled_Card  = ProtoField.uint32("IfIndexBitFiled.card", "card index", base.DEC, Num_Em, 0x1f800000)
	local IfIndexBitFiled_PortType_Vlan  = ProtoField.uint32("IfIndexBitFiled.PortType_Vlan", "Vlan", base.DEC, IfIndexBitFiled_PortType_Vlan_Em, 0x400000)
	local IfIndexBitFiled_PortType_Aggregation  = ProtoField.uint32("IfIndexBitFiled.PortType_Aggregation", "Aggregation", base.DEC, IfIndexBitFiled_PortType_Aggregation_Em, 0x200000)
	local IfIndexBitFiled_PortType_Location  = ProtoField.uint32("IfIndexBitFiled.PortType_Location", "Location", base.DEC, IfIndexBitFiled_PortType_Location_Em, 0x100000)
	local IfIndexBitFiled_PortType_Layer = ProtoField.uint32("IfIndexBitFiled.PortType_Layer", "Layer", base.DEC, IfIndexBitFiled_PortType_Layer_Em, 0x80000)
	local IfIndexBitFiled_Port = ProtoField.uint32("IfIndexBitFiled.Port", "Port", base.DEC, Num_Em, 0x7F000)
	
    local PtpSendPtpPktAsk_PortCfg = Proto("PtpSendPtpPktAsk_PortCfg", "PortCfg")
    local PtpSendPtpPktAsk_PortCfg_IfIndex = ProtoField.uint32("PtpSendPtpPktAsk_PortCfg.IfIndex", "IfIndex", base.HEX_DEC)
    local PtpSendPtpPktAsk_PortCfg_EncapMode = ProtoField.uint8("PtpSendPtpPktAsk_PortCfg.EncapMode", "EncapMode", base.DEC)
    local PtpSendPtpPktAsk_PortCfg_SpVlanTPID = ProtoField.uint32("PtpSendPtpPktAsk_PortCfg.SpVlanTPID", "SpVlanTPID", base.HEX)  
    local PtpSendPtpPktAsk_PortCfg_SpVlanId = ProtoField.uint32("PtpSendPtpPktAsk_PortCfg.SpVlanId", "SpVlanId", base.DEC)  
    local PtpSendPtpPktAsk_PortCfg_SpVlanPri = ProtoField.uint8("PtpSendPtpPktAsk_PortCfg.SpVlanPri", "SpVlanPri", base.DEC)  
    local PtpSendPtpPktAsk_PortCfg_CeVlanTPID = ProtoField.uint32("PtpSendPtpPktAsk_PortCfg.CeVlanTPID", "CeVlanTPID", base.HEX)  
    local PtpSendPtpPktAsk_PortCfg_CeVlanId = ProtoField.uint32("PtpSendPtpPktAsk_PortCfg.CeVlanId", "CeVlanId", base.DEC)  
    local PtpSendPtpPktAsk_PortCfg_CeVlanPri = ProtoField.uint8("PtpSendPtpPktAsk_PortCfg.CeVlanPri", "CeVlanPri", base.DEC)  
    local PtpSendPtpPktAsk_PortCfg_L2IpAddr = ProtoField.ipv4("PtpSendPtpPktAsk_PortCfg.L2IpAddr", "L2IpAddr", base.IPv4)  
    local PtpSendPtpPktAsk_PortCfg_Macaddr = ProtoField.ether("PtpSendPtpPktAsk_PortCfg.Macaddr", "Macaddr", base.ETHER) 
    PtpSendPtpPktAsk_PortCfg.fields = { 
		PtpSendPtpPktAsk_PortCfg_IfIndex,
		IfIndexBitFiled_Equipment,
		IfIndexBitFiled_Control,
		IfIndexBitFiled_Card,
		IfIndexBitFiled_PortType_Vlan,
		IfIndexBitFiled_PortType_Aggregation,
		IfIndexBitFiled_PortType_Location,
		IfIndexBitFiled_PortType_Layer,
		IfIndexBitFiled_Port,
		PtpSendPtpPktAsk_PortCfg_EncapMode,
		PtpSendPtpPktAsk_PortCfg_SpVlanTPID,
		PtpSendPtpPktAsk_PortCfg_SpVlanId,
		PtpSendPtpPktAsk_PortCfg_SpVlanPri,
		PtpSendPtpPktAsk_PortCfg_CeVlanTPID,
		PtpSendPtpPktAsk_PortCfg_CeVlanId,
		PtpSendPtpPktAsk_PortCfg_CeVlanPri,
		PtpSendPtpPktAsk_PortCfg_L2IpAddr,
		PtpSendPtpPktAsk_PortCfg_Macaddr
    }
	
	--PtpRecvPtpPktRsp
	local PtpRecvPtpPktRsp = Proto("PtpRecvPtpPktRsp", "PtpRecvPtpPktRsp")
	--解析PtpRecvPtpPktRsp_msgType值代表的含义
	local Ptp_msgType_Em = {
		[0] = "Sync Message",
		[1] = "Delay_Req Message",
		[2] = "Pdelay_Req Message",
		[3] = "Pdelay_Resp Message",
		[8] = "Follow_Up Message",
		[9] = "Delay_Resp Message",
		[10] = "Pdelay_Resp_Follow_Up Message",
		[11] = "Announce Message",
		[12] = "Signalling Message",
		[13] = "Management Message"
	}
	local PtpRecvPtpPktRsp_PktType = ProtoField.uint8("PtpRecvPtpPktRsp.PktType", "PktType", base.DEC)
	local PtpRecvPtpPktRsp_msgType = ProtoField.uint8("PtpRecvPtpPktRsp.msgType", "msgType", base.DEC, Ptp_msgType_Em)
	local PtpRecvPtpPktRsp_PktLen = ProtoField.uint16("PtpRecvPtpPktRsp.PktLen", "ptp message length", base.DEC)
	local PtpRecvPtpPktRsp_ifIndex = ProtoField.uint32("PtpRecvPtpPktRsp.ifIndex", "ifIndex", base.HEX)
	local PtpRecvPtpPktRsp_SourceIP = ProtoField.ipv4("PtpRecvPtpPktRsp.SourceIP", "SourceIP", base.IPv4)
	local PtpRecvPtpPktRsp_Vlan1 = ProtoField.uint16("PtpRecvPtpPktRsp.Vlan1", "Vlan1", base.DEC)
	local PtpRecvPtpPktRsp_Vlan2 = ProtoField.uint16("PtpRecvPtpPktRsp.Vlan2", "Vlan2", base.DEC)
	PtpRecvPtpPktRsp.fields = {
		PtpRecvPtpPktRsp_PktType,
		PtpRecvPtpPktRsp_msgType,
		PtpRecvPtpPktRsp_PktLen,
		PtpRecvPtpPktRsp_ifIndex,
		PtpRecvPtpPktRsp_SourceIP,
		PtpRecvPtpPktRsp_Vlan1,
		PtpRecvPtpPktRsp_Vlan2
	}
	
	--PtpEvtIfStatProcAsk
	local PtpEvtIfStatProcAsk = Proto("PtpEvtIfStatProcAsk", "PtpEvtIfStatProcAsk")
	local PtpEvtIfStatProcAsk_LinkUp = ProtoField.uint8("PtpEvtIfStatProcAsk.LinkUp", "LinkUp", base.BOOLEAN)
	local PtpEvtIfStatProcAsk_IfIndex = ProtoField.uint32("PtpEvtIfStatProcAsk.IfIndex", "IfIndex", base.HEX)
	PtpEvtIfStatProcAsk.fields = {
		PtpEvtIfStatProcAsk_LinkUp,
		PtpEvtIfStatProcAsk_IfIndex
	}
	
	--PtpSetSysTimeDriftAsk,PtpSetSysTimeOffsetAsk,PtpSetSysTimetAsk通用
	local PtpTime = Proto("PtpTime", "PtpTime")
	local PtpTime_ifIndex = ProtoField.uint32("PtpTime.ifIndex", "ifIndex", base.HEX)
	PtpTime.fields = {
		PtpTime_ifIndex,
	}
	
	local PtpTime_TsSpecTime = Proto("PtpTime_TsSpecTime", "TsSpecTime")
	local PtpTime_TsSpecTime_isnegative = ProtoField.bool("PtpTime_TsSpecTime.isnegative", "isnegative", base.BOOLEAN)
	local PtpTime_TsSpecTime_seconds = ProtoField.uint64("PtpTime_TsSpecTime.seconds", "seconds", base.DEC )
	local PtpTime_TsSpecTime_nanoseconds = ProtoField.uint32("PtpTime_TsSpecTime.nanoseconds", "nanoseconds", base.DEC)  
	PtpTime_TsSpecTime.fields = {
		PtpTime_TsSpecTime_isnegative,
		PtpTime_TsSpecTime_seconds,
		PtpTime_TsSpecTime_nanoseconds
	}
	
	--PtpTriggerSyncTime
	local PtpTriggerSyncTime = Proto("PtpTriggerSyncTime", "PtpTriggerSyncTime")
	local PtpTriggerSyncTime_TriggerSync = ProtoField.bool("PtpTriggerSyncTime.TriggerSync", "TriggerSync", base.BOOLEAN)
	PtpTriggerSyncTime.fields = {
		PtpTriggerSyncTime_TriggerSync
	}
	
	--PtpSyncMsDrift
	local PtpSyncMsDrift = Proto("PtpSyncMsDrift", "PtpSyncMsDrift")
	local PtpSyncMsDrift_psec_per_sec = ProtoField.int64("PtpSyncMsDrift.psec_per_sec", "psec_per_sec", base.DEC)
	PtpSyncMsDrift.fields = {
		PtpSyncMsDrift_psec_per_sec
	}	
	
	--PtpBestClkSet
	local PtpBestClkSet = Proto("PtpBestClkSet", "PtpBestClkSet")
	local PtpBestClkSet_SlotIdx = ProtoField.uint16("PtpBestClkSet.SlotIdx", "SlotIdx", base.DEC)
	PtpBestClkSet.fields = {
		PtpBestClkSet_SlotIdx
	}
	local CTLTClkSet = Proto("CTLTClkSet", "CTLTClkSet")
	local CTLTClkSet_o_isUc = ProtoField.bool("CTLTClkSet.o_isUc", "o_isUc", base.BOOLEAN)
	local CTLTClkSet_o_o_sf = ProtoField.bool("CTLTClkSet.o_sf", "o_sf", base.BOOLEAN)
	local CTLTClkSet_o_masterOnly = ProtoField.bool("CTLTClkSet.o_masterOnly", "o_masterOnly", base.BOOLEAN)
	local CTLTClkSet_b_localPrio = ProtoField.uint8("CTLTClkSet.b_localPrio", "b_localPrio", base.DEC)
	local CTLTClkSet_n_portIndex = ProtoField.uint8("CTLTClkSet.n_portIndex", "n_portIndex", base.DEC)
	local CTLTClkSet_n_portPriority = ProtoField.uint8("CTLTClkSet.n_portPriority", "n_portPriority", base.DEC)
	local CTLTClkSet_o_isSlaveOnly = ProtoField.bool("CTLTClkSet.o_isSlaveOnly", "o_isSlaveOnly", base.BOOLEAN)
	local CTLTClkSet_dw_time_val = ProtoField.uint64("CTLTClkSet.dw_time_val", "dw_time_val", base.DEC)
	local CTLTClkSet_o_isValid = ProtoField.bool("CTLTClkSet.o_isValid", "o_isValid", base.BOOLEAN)
	local CTLTClkSet_o_ageout = ProtoField.bool("CTLTClkSet.o_ageout", "o_ageout", base.BOOLEAN)
	CTLTClkSet.fields = {
		CTLTClkSet_o_isUc,
		CTLTClkSet_o_o_sf,
		CTLTClkSet_o_masterOnly,
		CTLTClkSet_b_localPrio,
		CTLTClkSet_n_portIndex,
		CTLTClkSet_n_portPriority,
		CTLTClkSet_o_isSlaveOnly,
		CTLTClkSet_dw_time_val,
		CTLTClkSet_o_isValid,
		CTLTClkSet_o_ageout
	}
	
	--解析PTP_t_tmSrc_Em值代表的含义
	local PTP_t_tmSrc_Em = {
		[0x10] ="ATOMIC_CLK",
		[0x20] ="GPS",
		[0x30] ="TER_RADIO",
		[0x40] ="PTP",
		[0x50] ="NTP",
		[0x60] ="HAND_SET",
		[0x90] ="OTHER",
		[0xA0] ="INT_OSC"
	}
	
	--NIFTPTPV2AnnMsg
	local NIFTPTPV2AnnMsg = Proto("NIFTPTPV2AnnMsg", "NIFTPTPV2AnnMsg")
	local NIFTPTPV2AnnMsg_i_curUTCOffs = ProtoField.uint16("NIFTPTPV2AnnMsg.i_curUTCOffs", "i_curUTCOffs", base.DEC)
	local NIFTPTPV2AnnMsg_b_grdMstPrio1 = ProtoField.uint8("NIFTPTPV2AnnMsg.b_grdMstPrio1", "b_grdMstPrio1", base.DEC)
	local NIFTPTPV2AnnMsg_b_grdMstPrio2 = ProtoField.uint8("NIFTPTPV2AnnMsg.b_grdMstPrio2", "b_grdMstPrio2", base.DEC)
	local NIFTPTPV2AnnMsg_w_stepsRemvd = ProtoField.uint16("NIFTPTPV2AnnMsg.w_stepsRemvd", "w_stepsRemvd", base.DEC)
	local NIFTPTPV2AnnMsg_e_timeSrc = ProtoField.uint32("NIFTPTPV2AnnMsg.e_timeSrc", "e_timeSrc", base.HEX, PTP_t_tmSrc_Em)
	
	NIFTPTPV2AnnMsg.fields = {
		NIFTPTPV2AnnMsg_i_curUTCOffs,
		NIFTPTPV2AnnMsg_b_grdMstPrio1,
		NIFTPTPV2AnnMsg_b_grdMstPrio2,
		NIFTPTPV2AnnMsg_w_stepsRemvd,
		NIFTPTPV2AnnMsg_e_timeSrc
	}
	
	--解析PTP_t_cf_Em值代表的含义
	local PTP_t_cf_Em = {
		[0] = "Sync Message",
		[1] = "Delay_Req Message",
		[2] = "Follow_Up Message",
		[3] = "Delay_Resp Message",
		[4] = "Management Message",
		[5] = "all other Message"
	}
	
	--NIFTPTPV2Head
	local NIFTPTPV2Head = Proto("NIFTPTPV2Head", "NIFTPTPV2Head")
	local NIFTPTPV2Head_e_msgType = ProtoField.uint32("NIFTPTPV2Head.e_msgType", "e_msgType", base.DEC, Ptp_msgType_Em)
	local NIFTPTPV2Head_b_versPTP = ProtoField.uint8("NIFTPTPV2Head.b_versPTP", "b_versPTP", base.DEC)
	local NIFTPTPV2Head_w_msgLen = ProtoField.uint16("NIFTPTPV2Head.w_msgLen", "w_msgLen", base.DEC)
	local NIFTPTPV2Head_b_dmnNmb = ProtoField.uint8("NIFTPTPV2Head.b_dmnNmb", "b_dmnNmb", base.DEC)
	local NIFTPTPV2Head_w_flags = ProtoField.uint16("NIFTPTPV2Head.w_flags", "w_flags", base.DEC)
	local NIFTPTPV2Head_ll_corField = ProtoField.uint64("NIFTPTPV2Head.ll_corField", "ll_corField", base.DEC)
	local NIFTPTPV2Head_dw_reseved = ProtoField.uint32("NIFTPTPV2Head.dw_reseved", "dw_reseved", base.DEC)
	local NIFTPTPV2Head_w_seqId = ProtoField.uint16("NIFTPTPV2Head.w_seqId", "w_seqId", base.DEC)
	local NIFTPTPV2Head_e_ctrl = ProtoField.uint32("NIFTPTPV2Head.e_ctrl", "e_ctrl", base.DEC, PTP_t_cf_Em)
	local NIFTPTPV2Head_c_logMeanMsgIntv = ProtoField.int8("NIFTPTPV2Head.c_logMeanMsgIntv", "c_logMeanMsgIntv", base.DEC)
	NIFTPTPV2Head.fields = {
		NIFTPTPV2Head_e_msgType,
		NIFTPTPV2Head_b_versPTP,
		NIFTPTPV2Head_w_msgLen,
		NIFTPTPV2Head_b_dmnNmb,
		NIFTPTPV2Head_w_flags,
		NIFTPTPV2Head_ll_corField,
		NIFTPTPV2Head_dw_reseved,
		NIFTPTPV2Head_w_seqId,
		NIFTPTPV2Head_e_ctrl,
		NIFTPTPV2Head_c_logMeanMsgIntv
	}
	
	--PTPTPortId
	local PTPTPortId = Proto("PTPTPortId", "PTPTPortId")
	local PTPTPortId_w_portNmb = ProtoField.uint16("PTPTPortId.w_portNmb", "w_portNmb", base.DEC)
	PTPTPortId.fields = {
		PTPTPortId_w_portNmb
	}
	
	--PTPTClkId
	local PTPTClkId = Proto("PTPTClkId", "PTPTClkId")
	local PTPTClkId_ab_id = ProtoField.uint64("PTPTClkId.w_portNmb", "w_portNmb", base.HEX)
	PTPTClkId.fields = {
		PTPTClkId_ab_id
	}
	
	--PTPTTmStmp
	local PTPTTmStmp = Proto("PTPTTmStmp", "PTPTTmStmp")
	local PTPTTmStmp_u48_sec = ProtoField.uint64("PTPTTmStmp.u48_sec", "u48_sec", base.DEC)
	local PTPTTmStmp_dw_Nsec = ProtoField.uint16("PTPTTmStmp.dw_Nsec", "dw_Nsec", base.DEC)
	PTPTTmStmp.fields = {
		PTPTTmStmp_u48_sec,
		PTPTTmStmp_dw_Nsec
	}
	
	--解析PTP_t_cf_Em值代表的含义
	local PTP_t_cf_Em = {
		[6] = "PRIM",
		[7] = "PRIM_HO",
		[8] = "ALT_PRO_1",
		[13] = "ARB",
		[14] = "ARB_HO",
		[52] = "PRIM_A",
		[58] = "ARB_A",
		[84] = "ALT_PRO_2",
		[90] = "ALT_PRO_3",
		[96] = "ALT_PRO_4",
		[104] = "ALT_PRO_5",
		[110] = "ALT_PRO_6",
		[140] = "ALT_PRO_7",
		[150] = "ALT_PRO_8",
		[160] = "ALT_PRO_9",
		[187] = "PRIM_B",
		[193] = "ARB_B",
		[248] = "DEF",
		[255] = "SLV_ONLY",
	}
	
	--解析PTP_t_cf_Em值代表的含义
	local PTP_t_clkAcc_Em = {
		[0x20] ="25NS",
		[0x21] ="100NS",
		[0x22] ="250NS",
		[0x23] ="1US",
		[0x24] ="2500NS",
		[0x25] ="10US",
		[0x26] ="25US",
		[0x27] ="100US",
		[0x28] ="250US",
		[0x29] ="1MS",
		[0x2A] ="2500US",
		[0x2B] ="10MS",
		[0x2C] ="25MS",
		[0x2D] ="100MS",
		[0x2E] ="250MS",
		[0x2F] ="1S",
		[0x30] ="10S",
		[0x31] ="L10S",
		[0xFE] ="UNKWN",
		[0xFF] ="RES"
	}

	--PTPTClkQual
	local PTPTClkQual = Proto("PTPTClkQual", "PTPTClkQual")
	local PTPTClkQual_e_clkClass = ProtoField.uint32("PTPTClkQual.e_clkClass", "e_clkClass", base.DEC, PTP_t_cf_Em)
	local PTPTClkQual_e_clkAccur = ProtoField.uint32("PTPTClkQual.e_clkAccur", "e_clkAccur", base.HEX, PTP_t_clkAcc_Em)
	local PTPTClkQual_w_scldVar = ProtoField.uint16("PTPTClkQual.w_scldVar", "w_scldVar", base.DEC)
	PTPTClkQual.fields = {
		PTPTClkQual_e_clkClass,
		PTPTClkQual_e_clkAccur,
		PTPTClkQual_w_scldVar
	}
	
	--PTPTPortAddr
	local PTPTPortAddr = Proto("PTPTPortAddr", "PTPTPortAddr")
	local PTPTPortAddr_e_netwProt = ProtoField.uint32("PTPTPortAddr.e_netwProt", "e_netwProt", base.DEC)
	local PTPTPortAddr_w_AddrLen = ProtoField.uint16("PTPTPortAddr.w_AddrLen", "w_AddrLen", base.DEC)
	local PTPTPortAddr_ab_Addr = ProtoField.uint32("PTPTPortAddr.ab_Addr", "ab_Addr", base.DEC)
	local PTPTPortAddr_b_vlan1 = ProtoField.uint16("PTPTPortAddr.b_vlan1", "b_vlan1", base.DEC)
	local PTPTPortAddr_b_vlan2 = ProtoField.uint16("PTPTPortAddr.b_vlan2", "b_vlan2", base.DEC)
	PTPTPortAddr.fields = {
		PTPTPortAddr_e_netwProt,
		PTPTPortAddr_w_AddrLen,
		PTPTPortAddr_ab_Addr,
		PTPTPortAddr_b_vlan1,
		PTPTPortAddr_b_vlan2
	}
	
	
	--解析holdOverStat_Em值代表的含义
	local holdOverStat_Em = {
		[1] ="FreeRun",
		[2] ="Acquiring",
		[3] ="Locked",
		[4] ="HoldOver_InSpec",
		[5] ="HoldOver_OutSpec"
	}

	--PtpSendCmmState
	local PtpSendCmmState = Proto("PtpSendCmmState", "PtpSendCmmState")
	local PtpSendCmmState_clockIdentityV1 = ProtoField.uint64("PtpSendCmmState.clockIdentityV1", "clockIdentityV1", base.HEX_DEC)
	local PtpSendCmmState_prntPortIdentityV1 = ProtoField.uint64("PtpSendCmmState.prntPortIdentityV1", "prntPortIdentityV1", base.HEX_DEC)
	local PtpSendCmmState_gmClkIdV1 = ProtoField.uint64("PtpSendCmmState.gmClkIdV1", "gmClkIdV1", base.HEX_DEC)
	local PtpSendCmmState_stepsRemovedV1 = ProtoField.uint32("PtpSendCmmState.stepsRemovedV1", "stepsRemovedV1", base.DEC)
	local PtpSendCmmState_prntStats = ProtoField.bool("PtpSendCmmState.prntStats", "prntStats", base.BOOLEAN)
	local PtpSendCmmState_prntOffsScldLogVar = ProtoField.int32("PtpSendCmmState.prntOffsScldLogVar", "prntOffsScldLogVar", base.DEC)
	local PtpSendCmmState_prntClkPhsChgRate = ProtoField.int32("PtpSendCmmState.prntClkPhsChgRate", "prntClkPhsChgRate", base.DEC)
	local PtpSendCmmState_gmClkClass = ProtoField.uint16("PtpSendCmmState.gmClkClass", "gmClkClass", base.DEC)
	local PtpSendCmmState_gmClkAccur = ProtoField.uint16("PtpSendCmmState.gmClkAccur", "gmClkAccur", base.DEC)
	local PtpSendCmmState_gmScldVar = ProtoField.uint32("PtpSendCmmState.gmScldVar", "gmScldVar", base.DEC)
	local PtpSendCmmState_gmPrio1 = ProtoField.uint16("PtpSendCmmState.gmPrio1", "gmPrio1", base.DEC)
	local PtpSendCmmState_gmPrio2 = ProtoField.uint16("PtpSendCmmState.gmPrio2", "gmPrio2", base.DEC)
	local PtpSendCmmState_portnum = ProtoField.uint16("PtpSendCmmState.portnum", "portnum", base.DEC)
	local PtpSendCmmState_ChssPos = ProtoField.uint16("PtpSendCmmState.ChssPos", "ChssPos", base.DEC)
	local PtpSendCmmState_holdOverStat = ProtoField.uint8("PtpSendCmmState.holdOverStat", "holdOverStat", base.DEC, holdOverStat_Em)
	
	PtpSendCmmState.fields = {
		PtpSendCmmState_clockIdentityV1,
		PtpSendCmmState_prntPortIdentityV1,
		PtpSendCmmState_gmClkIdV1,
		PtpSendCmmState_stepsRemovedV1,
		PtpSendCmmState_prntStats,
		PtpSendCmmState_prntOffsScldLogVar,
		PtpSendCmmState_prntClkPhsChgRate,
		PtpSendCmmState_gmClkClass,
		PtpSendCmmState_gmClkAccur,
		PtpSendCmmState_gmScldVar,
		PtpSendCmmState_gmPrio1,
		PtpSendCmmState_gmPrio2,
		PtpSendCmmState_portnum,
		PtpSendCmmState_ChssPos,
		PtpSendCmmState_holdOverStat
	}

	--PtpSetCardStat
	local PtpSetCardStat = Proto("PtpSetCardStat", "PtpSetCardStat")
	local PtpSetCardStat_ChssPos = ProtoField.uint16("PtpSetCardStat.ChssPos", "ChssPos", base.DEC)
	local PtpSetCardStat_holdOverStat = ProtoField.uint8("PtpSetCardStat.holdOverStat", "holdOverStat", base.DEC, holdOverStat_Em)
	PtpSetCardStat.fields = {
		PtpSetCardStat_ChssPos,
		PtpSetCardStat_holdOverStat
	}
	
	--PtpDestIp
	local PtpDestIp = Proto("PtpDestIp", "PtpDestIp")
	local PtpDestIp_slot = ProtoField.uint32("PtpDestIp.slot", "slot", base.DEC)
	PtpDestIp.fields = {
		PtpDestIp_slot
	}
	
	--PtpDestIp_destIp
	local PtpDestIp_destIp = Proto("PtpDestIp_destIp", "destIp")
	local PtpDestIp_destIp_ip = ProtoField.ipv4("PtpDestIp_destIp.ip", "ip", base.IPv4)
	PtpDestIp_destIp.fields = {
		PtpDestIp_destIp_ip
	}
	
    --[[  
        创建一个新的协议结构 ptp_fast_eth_proto  
        第一个参数是协议名称会体现在过滤器中  
        第二个参数是协议的描述信息，无关紧要  
    --]]  
    local ptp_fast_eth_proto = Proto("ptpFastEth", "Ptp Fast Eth Protolcol")  
    
	--解析ptpFastEthType值代表的含义
	local ptpFastEthIfindexEm = {
		[0xFFFFFFFD] = "Ptp_EthMsg_To_AllInterfaceCard",
		[0xFFFFFFFE] = "Ptp_EthMsg_To_OPCB",
		[0xFFFFFFFF] = "Ptp_EthMsg_To_AllCards"
	}
	
	--解析ptpFastEthType值代表的含义
	local ptpFastEthTypeEm = {
		[0] = "Ptp_SendPtpPktAsk",
		[1] = "Ptp_SendPtpPktRsp",
		[2] = "Ptp_RecvPtpPktAsk",
		[3] = "Ptp_RecvPtpPktRsp",
		[4] = "Ptp_GetSysTimeAsk",
		[5] = "Ptp_GetSysTimeRsp",
		[6] = "Ptp_EvtIfStatProcAsk",
		[7] = "Ptp_GetRxTimeStampAsk",
		[8] = "Ptp_GetRxTimeStampRsp",
		[9] = "Ptp_GetTxTimeStampAsk",
		[10] = "Ptp_GetTxTimeStampRsp",
		[11] = "Ptp_SetSysTimeDriftAsk",
		[12] = "Ptp_SetSysTimeOffsetAsk",
		[13] = "Ptp_ReportTodLosAlm",
		[14] = "Ptp_SetToggletimeToSystimeAsk",
		[15] = "Ptp_SetSysTimetAsk",
		[16] = "Ptp_SetSysTimeOffsetSecAsk",
		[17] = "Ptp_GetTxTimeStampOnNgm06Ask",
		[18] = "Ptp_TriggerSyncTime",
		[19] = "Ptp_SyncMsDrift",
		[20] = "Ptp_SendPtpPktAddr",
		[21] = "Ptp_BestClkSet",
		[22] = "Ptp_FwdPtpPkt",
		[23] = "Ptp_SendCmmState",
		[24] = "Ptp_PathDelay",
		[25] = "Ptp_StateTrap",
		[26] = "Ptp_CurrentDS",
		[27] = "Ptp_ParentDS",
		[28] = "Ptp_DefaultDS",
		[29] = "Ptp_TransDefaultDS",
		[30] = "Ptp_GetTxTimeStampOnInfCardAsk",
		[31] = "Ptp_GetTxTimeStampOnInfCardAnswer",
		[32] = "Ptp_DestIp",
		[33] = "Ptp_DestMacAsk",
		[34] = "Ptp_DestMacRsp",
		[35] = "Ptp_SrcIpMac",
		[36] = "Ptp_SrcIpMacAsk",
		[37] = "Ptp_SetNeStat",
		[38] = "Ptp_SetCardStat",
	}
    --[[  
        下面定义字段  
    --]]  
    local ptp_fast_eth_ifindex = ProtoField.uint32("ptpFastEth.Ifindex", "Ifindex", base.HEX, ptpFastEthIfindexEm)  
    local ptp_fast_eth_msessage_type = ProtoField.uint32("ptpFastEth.msessageType", "PTP Fast Eth Message Type", base.DEC, ptpFastEthTypeEm)  
      
    -- 将字段添加都协议中  
    ptp_fast_eth_proto.fields = {
        ptp_fast_eth_ifindex,  
        ptp_fast_eth_msessage_type
    }
	
	--创建一个新的解析结构
	--local ptp_fast_eth_dissectorTabel = DissectorTable.new("ptpFastEth.msessageType")
	    --[[  
        下面定义 foo 解析器的主函数，这个函数由 wireshark调用  
        第一个参数是 Tvb 类型，表示的是需要此解析器解析的数据  
        第二个参数是 Pinfo 类型，是协议解析树上的信息，包括 UI 上的显示  
        第三个参数是 TreeItem 类型，表示上一级解析树  
    --]]  
    function ptp_fast_eth_proto.dissector(tvb, pinfo, treeitem)
		
		-- 设置一些 UI 上面的信息
        pinfo.cols.protocol:set("ptpFastEth")  
        pinfo.cols.info:set("Ptp Fast Eth Protocol")  
          
        local offset = 0  
        local tvb_len = tvb:len() 
		
		-- 在上一级解析树上创建 ptpFastEth 的根节点  
        local ptp_fast_eth_tree = treeitem:add(ptp_fast_eth_proto, tvb:range(offset))  
		
		-- 下面是想该根节点上添加子节点，也就是自定义协议的各个字段  
        -- 注意 range 这个方法的两个参数的意义，第一个表示此时的偏移量  
        -- 第二个参数代表的是字段占用数据的长度  
        local ptp_fast_eth_ifindex_tree = ptp_fast_eth_tree:add(ptp_fast_eth_ifindex, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
		ptp_fast_eth_ifindex_tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
		offset = offset+4
        ptp_fast_eth_tree:add(ptp_fast_eth_msessage_type, tvb:range(offset, 4))
        offset = offset+4
		
		if tvb:range(offset - 4,4):uint()==0 then
			local PtpSendPtpPktAsk_tree = ptp_fast_eth_tree:add(PtpSendPtpPktAsk, tvb:range(offset))
			local PtpMessage_len = tvb:range(offset, 2):uint()
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_len, tvb:range(offset, 2))
			offset = offset+2 
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_channel_index, tvb:range(offset, 2))
			offset = offset+2 
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_slot, tvb:range(offset, 4))
			offset = offset+4
			
			local PtpSendPtpPktAsk_PortCfgTree_StartOffset = offset
			local PtpSendPtpPktAsk_PortCfgTree = PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_PortCfg, tvb:range(offset), "MsgPtpPortCfg")
			local PtpSendPtpPktAsk_PortCfg_IfIndex_Tree = PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_IfIndex, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_EncapMode, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanTPID, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanId, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanPri, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanTPID, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanId, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanPri, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_L2IpAddr, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_Macaddr, tvb:range(offset, 6))
			offset = offset+6
			offset = offset+2
			PtpSendPtpPktAsk_PortCfgTree:set_len(offset - PtpSendPtpPktAsk_PortCfgTree_StartOffset)
			
			if PtpMessage_len>0 then
				local ptpDissector = DissectorTable.get("udp.port"):get_dissector(320)
				ptpDissector:call(tvb:range(offset, PtpMessage_len):tvb(), pinfo, PtpSendPtpPktAsk_tree)
				offset = offset+PtpMessage_len
			end
			
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_pad, tvb:range(offset, 128 - PtpMessage_len))
			offset = offset+ 128 - PtpMessage_len
			
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_send_flag, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_ps_pAddr, tvb:range(offset, 4))
			offset = offset+4

		elseif tvb:range(offset - 4,4):uint()==3 then
			local PtpRecvPtpPktRsp_tree = ptp_fast_eth_tree:add(PtpRecvPtpPktRsp, tvb:range(offset))
			PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_PktType, tvb:range(offset, 1))
			offset = offset+1
			PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_msgType, tvb:range(offset, 1))
			offset = offset+1
			PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_PktLen, tvb:range(offset, 2))
			offset = offset+2
			local Ptp_RecvPtpPktRsp_ifIndex_tree = PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_ifIndex, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			Ptp_RecvPtpPktRsp_ifIndex_tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			
			local ptpDissector = DissectorTable.get("udp.port"):get_dissector(320)
			ptpDissector:call(tvb:range(offset):tvb(), pinfo, PtpRecvPtpPktRsp_tree)
			offset = offset+128
			
			PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_SourceIP, tvb:range(offset, 4))
			offset = offset+4
			PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_Vlan1, tvb:range(offset, 2))
			offset = offset+2
			PtpRecvPtpPktRsp_tree:add(PtpRecvPtpPktRsp_Vlan2, tvb:range(offset, 2))
			offset = offset+2
		elseif tvb:range(offset - 4,4):uint()==6 then
			pinfo.cols.protocol:set("PtpEvtIfStatProcAsk")  
			pinfo.cols.info:set("Evt If Stat Proc Ask")
			
			local PtpEvtIfStatProcAsk_tree = ptp_fast_eth_tree:add(PtpEvtIfStatProcAsk, tvb:range(offset))
			PtpEvtIfStatProcAsk_tree:add(PtpEvtIfStatProcAsk_LinkUp, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			local PtpEvtIfStatProcAsk_IfIndex_tree = PtpEvtIfStatProcAsk_tree:add(PtpEvtIfStatProcAsk_IfIndex, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpEvtIfStatProcAsk_IfIndex_tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
		elseif tvb:range(offset - 4,4):uint()==11 then
			pinfo.cols.protocol:set("PtpSetSysTimeDriftAsk")  
			pinfo.cols.info:set("Set Sys Time Drift Ask")
			
			local PtpTime_tree = ptp_fast_eth_tree:add(PtpTime, tvb:range(offset, 32))
			local PtpTime_ifIndex_tree = PtpTime_tree:add(PtpTime_ifIndex, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			offset = offset+4
			local PtpTime_TsSpecTime_Tree = PtpTime_tree:add(PtpTime_TsSpecTime, tvb:range(offset, 24), "time")
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_isnegative, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+7
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_seconds, tvb:range(offset, 8))
			offset = offset+8
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_nanoseconds, tvb:range(offset, 4))
			offset = offset+4
		elseif tvb:range(offset - 4,4):uint()==12 then
			pinfo.cols.protocol:set("PtpSetSysTimeOffsetAsk")  
			pinfo.cols.info:set("Set Sys Time Offset Ask")
			
			local PtpTime_tree = ptp_fast_eth_tree:add(PtpTime, tvb:range(offset, 32))
			local PtpTime_ifIndex_tree = PtpTime_tree:add(PtpTime_ifIndex, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			offset = offset+4
			local PtpTime_TsSpecTime_Tree = PtpTime_tree:add(PtpTime_TsSpecTime, tvb:range(offset, 24), "time")
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_isnegative, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_seconds, tvb:range(offset, 8))
			offset = offset+8
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_nanoseconds, tvb:range(offset, 4))
			offset = offset+4
		elseif tvb:range(offset - 4,4):uint()==15 then
			pinfo.cols.protocol:set("PtpSetSysTimetAsk")  
			pinfo.cols.info:set("Set Sys Time Ask")
			
			local PtpTime_tree = ptp_fast_eth_tree:add(PtpTime, tvb:range(offset))
			local PtpTime_ifIndex_tree = PtpTime_tree:add(PtpTime_ifIndex, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpTime_ifIndex_tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			local PtpTime_TsSpecTime_Tree = PtpTime_tree:add(PtpTime_TsSpecTime, tvb:range(offset), "time")
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_isnegative, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_seconds, tvb:range(offset, 8))
			offset = offset+8
			PtpTime_TsSpecTime_Tree:add(PtpTime_TsSpecTime_nanoseconds, tvb:range(offset, 4))
			offset = offset+4
			PtpTime_tree:add(PtpTime_pad, tvb:range(offset))
		elseif tvb:range(offset - 4,4):uint()==18 then
			pinfo.cols.protocol:set("PtpTriggerSyncTime")  
			pinfo.cols.info:set("Trigger Sync Time")
			
			local PtpTriggerSyncTime_tree = ptp_fast_eth_tree:add(PtpTriggerSyncTime, tvb:range(offset))
			PtpTriggerSyncTime_tree:add(PtpTriggerSyncTime_TriggerSync, tvb:range(offset, 1))
			offset = offset+1
		elseif tvb:range(offset - 4,4):uint()==19 then
			pinfo.cols.protocol:set("PtpSyncMsDrift")  
			pinfo.cols.info:set("Sync Ms Drift")
			
			local PtpSyncMsDrift_tree = ptp_fast_eth_tree:add(PtpSyncMsDrift, tvb:range(offset))
			PtpSyncMsDrift_tree:add(PtpSyncMsDrift_psec_per_sec, tvb:range(offset, 8))
			offset = offset+8
		elseif tvb:range(offset - 4,4):uint()==21 then
			pinfo.cols.protocol:set("PtpBestClkSet")  
			pinfo.cols.info:set("Best Clk Set")
			
			local PtpBestClkSet_tree = ptp_fast_eth_tree:add(PtpBestClkSet, tvb:range(offset))
			PtpBestClkSet_tree:add(PtpBestClkSet_SlotIdx, tvb:range(offset, 2))
			offset = offset+2
			offset = offset+6
			
			local CTLTClkSet_tree_StartOffset = offset
			local CTLTClkSet_tree = PtpBestClkSet_tree:add(CTLTClkSet, tvb:range(offset), "ClkSet")
			local NIFTPTPV2AnnMsg_tree_StartOffset = offset
			local NIFTPTPV2AnnMsg_tree = CTLTClkSet_tree:add(NIFTPTPV2AnnMsg, tvb:range(offset), "ps_anncMsg")
			local NIFTPTPV2Head_tree_StartOffset = offset
			local NIFTPTPV2Head_tree = NIFTPTPV2AnnMsg_tree:add(NIFTPTPV2Head, tvb:range(offset), "s_ptpHead")
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_e_msgType, tvb:range(offset, 4))
			offset = offset+4
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_b_versPTP, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+1
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_w_msgLen, tvb:range(offset, 2))
			offset = offset+2
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_b_dmnNmb, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+1
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_w_flags, tvb:range(offset, 2))
			offset = offset+2
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_ll_corField, tvb:range(offset, 8))
			offset = offset+8
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_dw_reseved, tvb:range(offset, 4))
			offset = offset+4
			offset = offset+4
			local PTPTPortId_tree_StartOffset = offset
			local PTPTPortId_tree = NIFTPTPV2Head_tree:add(PTPTPortId, tvb:range(offset), "s_srcPortId")
			local PTPTClkId_tree = PTPTPortId_tree:add(PTPTClkId, tvb:range(offset,8), "s_clkId")
			PTPTClkId_tree:add(PTPTClkId_ab_id, tvb:range(offset, 8))
			offset = offset+8
			PTPTPortId_tree:add(PTPTPortId_w_portNmb, tvb:range(offset, 2))
			offset = offset+2
			PTPTPortId_tree:set_len(offset - PTPTPortId_tree_StartOffset)
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_w_seqId, tvb:range(offset, 2))
			offset = offset+2
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_e_ctrl, tvb:range(offset, 4))
			offset = offset+4
			NIFTPTPV2Head_tree:add(NIFTPTPV2Head_c_logMeanMsgIntv, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+1
			offset = offset+2
			NIFTPTPV2Head_tree:set_len(offset - NIFTPTPV2Head_tree_StartOffset)
			local PTPTTmStmp_tree_StartOffset = offset
			local PTPTTmStmp_tree = NIFTPTPV2AnnMsg_tree:add(PTPTTmStmp, tvb:range(offset), "s_origTs")
			PTPTTmStmp_tree:add(PTPTTmStmp_u48_sec, tvb:range(offset, 8))
			offset = offset+8
			PTPTTmStmp_tree:add(PTPTTmStmp_dw_Nsec, tvb:range(offset, 4))
			offset = offset+4
			offset = offset+4
			PTPTTmStmp_tree:set_len(offset - PTPTTmStmp_tree_StartOffset)
			NIFTPTPV2AnnMsg_tree:add(NIFTPTPV2AnnMsg_i_curUTCOffs, tvb:range(offset, 2))
			offset = offset+2
			NIFTPTPV2AnnMsg_tree:add(NIFTPTPV2AnnMsg_b_grdMstPrio1, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+1
			local PTPTClkQual_tree_StartOffset = offset
			local PTPTClkQual_tree = NIFTPTPV2AnnMsg_tree:add(PTPTClkQual, tvb:range(offset), "s_grdMstClkQual")
			PTPTClkQual_tree:add(PTPTClkQual_e_clkClass, tvb:range(offset, 4))
			offset = offset+4
			PTPTClkQual_tree:add(PTPTClkQual_e_clkAccur, tvb:range(offset, 4))
			offset = offset+4
			PTPTClkQual_tree:add(PTPTClkQual_w_scldVar, tvb:range(offset, 2))
			offset = offset+2
			offset = offset+2
			PTPTClkQual_tree:set_len(offset - PTPTClkQual_tree_StartOffset)
			NIFTPTPV2AnnMsg_tree:add(NIFTPTPV2AnnMsg_b_grdMstPrio2, tvb:range(offset, 1))
			offset = offset+1
			local PTPTClkId_tree = NIFTPTPV2AnnMsg_tree:add(PTPTClkId, tvb:range(offset, 8), "s_grdMstId")
			PTPTClkId_tree:add(PTPTClkId_ab_id, tvb:range(offset, 8))
			offset = offset+8
			NIFTPTPV2AnnMsg_tree:add(NIFTPTPV2AnnMsg_w_stepsRemvd, tvb:range(offset, 2))
			offset = offset+2
			offset = offset+1
			NIFTPTPV2AnnMsg_tree:add(NIFTPTPV2AnnMsg_e_timeSrc, tvb:range(offset, 4))
			offset = offset+4
			NIFTPTPV2AnnMsg_tree:set_len(offset - NIFTPTPV2AnnMsg_tree_StartOffset)
			local PTPTPortId_tree = CTLTClkSet_tree:add(PTPTPortId, tvb:range(offset, 10), "ps_rcvPId")
			local PTPTClkId_tree = PTPTPortId_tree:add(PTPTClkId, tvb:range(offset, 8), "s_clkId")
			PTPTClkId_tree:add(PTPTClkId_ab_id, tvb:range(offset, 8))
			offset = offset+8
			PTPTPortId_tree:add(PTPTPortId_w_portNmb, tvb:range(offset, 2))
			offset = offset+2
			local PTPTPortId_tree = CTLTClkSet_tree:add(PTPTPortId, tvb:range(offset, 10), "ps_frgnPId")
			local PTPTClkId_tree = PTPTPortId_tree:add(PTPTClkId, tvb:range(offset, 8), "s_clkId")
			PTPTClkId_tree:add(PTPTClkId_ab_id, tvb:range(offset, 8))
			offset = offset+8
			PTPTPortId_tree:add(PTPTPortId_w_portNmb, tvb:range(offset, 2))
			offset = offset+2
			local PTPTPortAddr_tree_StartOffset = offset
			local PTPTPortAddr_tree = CTLTClkSet_tree:add(PTPTPortAddr, tvb:range(offset), "ps_pAddr")
			PTPTPortAddr_tree:add(PTPTPortAddr_e_netwProt, tvb:range(offset, 4))
			offset = offset+4
			PTPTPortAddr_tree:add(PTPTPortAddr_w_AddrLen, tvb:range(offset, 2))
			offset = offset+2
			offset = offset+2
			PTPTPortAddr_tree:add(PTPTPortAddr_ab_Addr, tvb:range(offset, 4))
			offset = offset+4
			PTPTPortAddr_tree:add(PTPTPortAddr_b_vlan1, tvb:range(offset, 2))
			offset = offset+2
			PTPTPortAddr_tree:add(PTPTPortAddr_b_vlan2, tvb:range(offset, 2))
			offset = offset+2
			PTPTPortAddr_tree:set_len(offset - PTPTPortAddr_tree_StartOffset)
			CTLTClkSet_tree:add(CTLTClkSet_o_isUc, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_o_o_sf, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_o_masterOnly, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_b_localPrio, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_n_portIndex, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_n_portPriority, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_o_isSlaveOnly, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_dw_time_val, tvb:range(offset, 8))
			offset = offset+8
			CTLTClkSet_tree:add(CTLTClkSet_o_isValid, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:add(CTLTClkSet_o_ageout, tvb:range(offset, 1))
			offset = offset+1
			CTLTClkSet_tree:set_len(offset - CTLTClkSet_tree_StartOffset)
		elseif tvb:range(offset - 4,4):uint()==23 then
			pinfo.cols.protocol:set("PtpSendCmmState")  
			pinfo.cols.info:set("Send Cmm State")
			
			local PtpSendCmmState_tree = ptp_fast_eth_tree:add(PtpSendCmmState, tvb:range(offset))
			PtpSendCmmState_tree:add(PtpSendCmmState_clockIdentityV1, tvb:range(offset, 8)):append_text("  MAC: "..tvb:range(offset, 1)..":"..tvb:range(offset+1, 1)..":"..tvb:range(offset+2, 1)..":"..tvb:range(offset+5, 1)..":"..tvb:range(offset+6, 1)..":"..tvb:range(offset+7, 1))
			offset = offset+8
			PtpSendCmmState_tree:add(PtpSendCmmState_prntPortIdentityV1, tvb:range(offset, 8)):append_text("  MAC: "..tvb:range(offset, 1)..":"..tvb:range(offset+1, 1)..":"..tvb:range(offset+2, 1)..":"..tvb:range(offset+5, 1)..":"..tvb:range(offset+6, 1)..":"..tvb:range(offset+7, 1))
			offset = offset+8
			PtpSendCmmState_tree:add(PtpSendCmmState_gmClkIdV1, tvb:range(offset, 8)):append_text("  MAC: "..tvb:range(offset, 1)..":"..tvb:range(offset+1, 1)..":"..tvb:range(offset+2, 1)..":"..tvb:range(offset+5, 1)..":"..tvb:range(offset+6, 1)..":"..tvb:range(offset+7, 1))
			offset = offset+8
			PtpSendCmmState_tree:add(PtpSendCmmState_stepsRemovedV1, tvb:range(offset, 4))
			offset = offset+4
			PtpSendCmmState_tree:add(PtpSendCmmState_prntStats, tvb:range(offset,1))
			offset = offset+1
			offset = offset+3
			PtpSendCmmState_tree:add(PtpSendCmmState_prntOffsScldLogVar, tvb:range(offset, 4))
			offset = offset+4
			PtpSendCmmState_tree:add(PtpSendCmmState_prntClkPhsChgRate, tvb:range(offset, 4))
			offset = offset+4
			PtpSendCmmState_tree:add(PtpSendCmmState_gmClkClass, tvb:range(offset, 2))
			offset = offset+2
			PtpSendCmmState_tree:add(PtpSendCmmState_gmClkAccur, tvb:range(offset, 2))
			offset = offset+2
			PtpSendCmmState_tree:add(PtpSendCmmState_gmScldVar, tvb:range(offset, 4))
			offset = offset+4
			PtpSendCmmState_tree:add(PtpSendCmmState_gmPrio1, tvb:range(offset, 2))
			offset = offset+2
			PtpSendCmmState_tree:add(PtpSendCmmState_gmPrio2, tvb:range(offset, 2))
			offset = offset+2
			PtpSendCmmState_tree:add(PtpSendCmmState_portnum, tvb:range(offset, 2))
			offset = offset+2
			PtpSendCmmState_tree:add(PtpSendCmmState_ChssPos, tvb:range(offset, 2))
			offset = offset+2
			PtpSendCmmState_tree:add(PtpSendCmmState_holdOverStat, tvb:range(offset, 1))
			offset = offset+1
		elseif tvb:range(offset - 4,4):uint()==32 then
			pinfo.cols.protocol:set("PtpDestIp")  
			pinfo.cols.info:set("Dest Ip")
			
			local PtpDestIp_tree = ptp_fast_eth_tree:add(PtpDestIp, tvb:range(offset))
			PtpDestIp_tree:add(PtpDestIp_slot, tvb:range(offset, 4))
			offset = offset+4
			local PtpDestIp_destIp_tree = PtpDestIp_tree:add(PtpDestIp_destIp, tvb:range(offset))
			for i=0,tvb:range(offset):len()-4,4 do
				PtpDestIp_destIp_tree:add(PtpDestIp_destIp_ip, tvb:range(offset, 4)):append_text("  [channel:"..tostring(i/4).."]")
				offset = offset+4
			end
			
		elseif tvb:range(offset - 4,4):uint()==33 then
			pinfo.cols.protocol:set("PtpDestMacAsk")  
			pinfo.cols.info:set("Dest Mac Ask")
			
			local PtpSendPtpPktAsk_tree = ptp_fast_eth_tree:add(PtpSendPtpPktAsk, tvb:range(offset))
			local PtpMessage_len = tvb:range(offset, 2):uint()
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_len, tvb:range(offset, 2))
			offset = offset+2 
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_channel_index, tvb:range(offset, 2))
			offset = offset+2 
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_slot, tvb:range(offset, 4))
			offset = offset+4
			
			local PtpSendPtpPktAsk_PortCfgTree_StartOffset = offset
			local PtpSendPtpPktAsk_PortCfgTree = PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_PortCfg, tvb:range(offset), "MsgPtpPortCfg")
			local PtpSendPtpPktAsk_PortCfg_IfIndex_Tree = PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_IfIndex, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_EncapMode, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanTPID, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanId, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanPri, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanTPID, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanId, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanPri, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_L2IpAddr, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_Macaddr, tvb:range(offset, 6))
			offset = offset+6
			offset = offset+2
			PtpSendPtpPktAsk_PortCfgTree:set_len(offset - PtpSendPtpPktAsk_PortCfgTree_StartOffset)
			
			if PtpMessage_len>0 then
				local ptpDissector = DissectorTable.get("udp.port"):get_dissector(320)
				ptpDissector:call(tvb:range(offset, PtpMessage_len):tvb(), pinfo, PtpSendPtpPktAsk_tree)
				offset = offset+PtpMessage_len
			end
			
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_pad, tvb:range(offset, 128 - PtpMessage_len))
			offset = offset+ 128 - PtpMessage_len
			
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_send_flag, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_ps_pAddr, tvb:range(offset, 4))
			offset = offset+4
		elseif tvb:range(offset - 4,4):uint()==34 then
			pinfo.cols.protocol:set("PtpDestMacRsp")  
			pinfo.cols.info:set("Dest Mac Rsp")
			
			local PtpSendPtpPktAsk_tree = ptp_fast_eth_tree:add(PtpSendPtpPktAsk, tvb:range(offset))
			local PtpMessage_len = tvb:range(offset, 2):uint()
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_len, tvb:range(offset, 2))
			offset = offset+2 
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_channel_index, tvb:range(offset, 2))
			offset = offset+2 
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_slot, tvb:range(offset, 4))
			offset = offset+4
			
			local PtpSendPtpPktAsk_PortCfgTree_StartOffset = offset
			local PtpSendPtpPktAsk_PortCfgTree = PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_PortCfg, tvb:range(offset), "MsgPtpPortCfg")
			local PtpSendPtpPktAsk_PortCfg_IfIndex_Tree = PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_IfIndex, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Equipment, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Control, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Card, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Vlan, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Aggregation, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Location, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_PortType_Layer, tvb:range(offset, 4))
			PtpSendPtpPktAsk_PortCfg_IfIndex_Tree:add(IfIndexBitFiled_Port, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_EncapMode, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanTPID, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanId, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_SpVlanPri, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanTPID, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanId, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_CeVlanPri, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_L2IpAddr, tvb:range(offset, 4))
			offset = offset+4
			PtpSendPtpPktAsk_PortCfgTree:add(PtpSendPtpPktAsk_PortCfg_Macaddr, tvb:range(offset, 6))
			offset = offset+6
			offset = offset+2
			PtpSendPtpPktAsk_PortCfgTree:set_len(offset - PtpSendPtpPktAsk_PortCfgTree_StartOffset)
			
			if PtpMessage_len>0 then
				local ptpDissector = DissectorTable.get("udp.port"):get_dissector(320)
				ptpDissector:call(tvb:range(offset, PtpMessage_len):tvb(), pinfo, PtpSendPtpPktAsk_tree)
				offset = offset+PtpMessage_len
			end
			
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_pad, tvb:range(offset, 128 - PtpMessage_len))
			offset = offset+ 128 - PtpMessage_len
			
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_send_flag, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+3
			PtpSendPtpPktAsk_tree:add(PtpSendPtpPktAsk_ps_pAddr, tvb:range(offset, 4))
			offset = offset+4
			
		--elseif tvb:range(offset - 4,4):uint()==35 then
		--elseif tvb:range(offset - 4,4):uint()==36 then
		--elseif tvb:range(offset - 4,4):uint()==37 then
		elseif tvb:range(offset - 4,4):uint()==38 then
			pinfo.cols.protocol:set("PtpSetCardStat")  
			pinfo.cols.info:set("Set Card Stat")
			
			local PtpSetCardStat_tree = ptp_fast_eth_tree:add(PtpSetCardStat, tvb:range(offset, 4))
			PtpSetCardStat_tree:add(PtpSetCardStat_ChssPos, tvb:range(offset, 2))
			offset = offset+2
			PtpSetCardStat_tree:add(PtpSetCardStat_holdOverStat, tvb:range(offset, 1))
			offset = offset+1
			offset = offset+1
		end
		--elseif tvb:range(offset - 4,4):uint()==39 then
		--elseif tvb:range(offset - 4,4):uint()==40 then

	end
	
	--代码里原始的快速以太的PTP报文的类型为0x88f7，和真实的PTP报文重叠了，此处区分开
	MayBeFastEthProto = Proto("MayBeFastEth", "MayBeFastEth")
	function MayBeFastEthProto.dissector(tvb, pinfo, treeitem)
		
		--PTP协议的transportSpecific不为0(这个字段的位置为自定义的快速以太报文的ifindex的Equipment+Control+card index的第一个bit，一般为0xf或者2)
		--且version字段不为1或2(这两个字段的位置为自定义的快速以太报文的ifindex的port index的前4个bit，一般为8(L3端口)、0(L2端口)、0xf(广播、发到指定槽位))。
		if tvb:range(0,1):bitfield(0,4)~=0 and (tvb:range(1,1):bitfield(0,4)~=2 or tvb:range(1,1):bitfield(0,4)~=1) then
			ptp_fast_eth_proto.dissector(tvb, pinfo, treeitem)
		else
			local ptpDissector = DissectorTable.get("udp.port"):get_dissector(320)
			ptpDissector:call(tvb:range(offset):tvb(), pinfo, treeitem)
		end
	end
	
	  
    -- 向 wireshark 注册协议插件被调用的条件  
    local ethertype_table = DissectorTable.get("ethertype")
    ethertype_table:add(65000, ptp_fast_eth_proto)
	ethertype_table:add(0x88f7, MayBeFastEthProto)
end  