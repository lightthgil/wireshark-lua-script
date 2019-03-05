do

	--[[  
        创建一个新的协议结构 PtpSendPtpPktAsk  
        第一个参数是协议名称会体现在过滤器中  
        第二个参数是协议的描述信息，无关紧要  
    --]]  
    local Bcm2CpuPtp = Proto("Bcm2CpuPtp", "Bcm2CpuPtp")
      
    --[[  
        下面定义字段  
    --]]  
	--local Bcm2CpuPtp_string = ProtoField.string("Bcm2CpuPtp.pad", "Padding", base.STRING)  
      
  	-- 将字段添加到协议中  
    Bcm2CpuPtp.fields = { 
	--	Bcm2CpuPtp_string
    }
	
	--[[  
        下面定义 Bcm2CpuPtp 解析器的主函数，这个函数由 wireshark调用  
        第一个参数是 Tvb 类型，表示的是需要此解析器解析的数据  
        第二个参数是 Pinfo 类型，是协议解析树上的信息，包括 UI 上的显示  
        第三个参数是 TreeItem 类型，表示上一级解析树  
    --]]  
    function Bcm2CpuPtp.dissector(tvb, pinfo, treeitem)
		-- 设置一些 UI 上面的信息
        pinfo.cols.protocol:set("Bcm2CpuPtp")
        pinfo.cols.info:set("Bcm2CpuPtp")
		
		local offset = 0  
        local tvb_len = tvb:len() 
		
		-- 在上一级解析树上创建 Bcm2CpuPtp 的根节点  
        local Bcm2CpuPtp_tree = treeitem:add(Bcm2CpuPtp, tvb:range(offset))
		
		-- 下面是想该根节点上添加子节点，也就是自定义协议的各个字段  
        -- 注意 range 这个方法的两个参数的意义，第一个表示此时的偏移量  
        -- 第二个参数代表的是字段占用数据的长度
        local ptpDissector = DissectorTable.get("udp.port"):get_dissector(320)
		ptpDissector:call(tvb:range(offset):tvb(), pinfo, Bcm2CpuPtp_tree)

	end
	
	-- 向 wireshark 注册协议插件被调用的条件  
    local ethertype_table = DissectorTable.get("ethertype")
    ethertype_table:add(65001, Bcm2CpuPtp)
end  
	
	