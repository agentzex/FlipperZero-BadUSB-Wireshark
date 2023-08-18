-----------------------------------------------------------------------------
-- BadUSB Keyboard Dissector 
-- https://github.com/agentzex/FlipperZero-BadUSB-Wireshark
-----------------------------------------------------------------------------
           
-- Modifier keys bitmask
MODIFIER_KEYS = {
    { value = 0x01, name = "[LEFT-CTRL]" },
    { value = 0x02, name = "[LEFT-SHIFT]" },
    { value = 0x04, name = "[LEFT-ALT]" },
    { value = 0x08, name = "[LEFT-GUI]" },
    { value = 0x10, name = "[RIGHT-CTRL]" },
    { value = 0x20, name = "[RIGHT-SHIFT]" },
    { value = 0x40, name = "[RIGHT-ALT]" },
    { value = 0x80, name = "[RIGHT-GUI]" }
}


KEY_MAP = {
	[0x04] = { normal = "a", shifted = "A" },
	[0x05] = { normal = "b", shifted = "B" },
	[0x06] = { normal = "c", shifted = "C" },
	[0x07] = { normal = "d", shifted = "D" },
	[0x08] = { normal = "e", shifted = "E" },
	[0x09] = { normal = "f", shifted = "F" },
	[0x0A] = { normal = "g", shifted = "G" },
	[0x0B] = { normal = "h", shifted = "H" },
	[0x0C] = { normal = "i", shifted = "I" },
	[0x0D] = { normal = "j", shifted = "J" },
	[0x0E] = { normal = "k", shifted = "K" },
	[0x0F] = { normal = "l", shifted = "L" },
	[0x10] = { normal = "m", shifted = "M" },
	[0x11] = { normal = "n", shifted = "N" },
	[0x12] = { normal = "o", shifted = "O" },
	[0x13] = { normal = "p", shifted = "P" },
	[0x14] = { normal = "q", shifted = "Q" },
	[0x15] = { normal = "r", shifted = "R" },
	[0x16] = { normal = "s", shifted = "S" },
	[0x17] = { normal = "t", shifted = "T" },
	[0x18] = { normal = "u", shifted = "U" },
	[0x19] = { normal = "v", shifted = "V" },
	[0x1A] = { normal = "w", shifted = "W" },
	[0x1B] = { normal = "x", shifted = "X" },
	[0x1C] = { normal = "y", shifted = "Y" },
	[0x1D] = { normal = "z", shifted = "Z" },
	[0x1E] = { normal = "1", shifted = "!" },
	[0x1F] = { normal = "2", shifted = "@" },
	[0x20] = { normal = "3", shifted = "#" },
	[0x21] = { normal = "4", shifted = "$" },
	[0x22] = { normal = "5", shifted = "%" },
	[0x23] = { normal = "6", shifted = "^" },
	[0x24] = { normal = "7", shifted = "&" },
	[0x25] = { normal = "8", shifted = "*" },
	[0x26] = { normal = "9", shifted = "(" },
	[0x27] = { normal = "0", shifted = ")" },
	[0x28] = { normal = "[ENTER]", shifted = "[ENTER]" },
	[0x29] = { normal = "[ESC]", shifted = "[ESC]" },
	[0x2A] = { normal = "[BACKSPACE]", shifted = "[BACKSPACE]" },
	[0x2B] = { normal = "[TAB]", shifted = "[TAB]" },
	[0x2C] = { normal = "[SPACE]", shifted = "[SPACE]" },
	[0x2D] = { normal = "-", shifted = "_" },
	[0x2E] = { normal = "=", shifted = "+" },
	[0x2F] = { normal = "[", shifted = "{" },
	[0x30] = { normal = "]", shifted = "}" },
	[0x31] = { normal = "\\", shifted = "|" },
	[0x33] = { normal = ";", shifted = ":" },
	[0x34] = { normal = "'", shifted = "\"" },
	[0x35] = { normal = "`", shifted = "~" },
	[0x36] = { normal = ",", shifted = "<" },
	[0x37] = { normal = ".", shifted = ">" },
	[0x38] = { normal = "/", shifted = "?" },
	[0x39] = { normal = "[CAPS LOCK]", shifted = "[CAPS LOCK]" },
	[0x3A] = { normal = "[F1]", shifted = "[F1]" },
	[0x3B] = { normal = "[F2]", shifted = "[F2]" },
	[0x3C] = { normal = "[F3]", shifted = "[F3]" },
	[0x3D] = { normal = "[F4]", shifted = "[F4]" },
	[0x3E] = { normal = "[F5]", shifted = "[F5]" },
	[0x3F] = { normal = "[F6]", shifted = "[F6]" },
	[0x40] = { normal = "[F7]", shifted = "[F7]" },
	[0x41] = { normal = "[F8]", shifted = "[F8]" },
	[0x42] = { normal = "[F9]", shifted = "[F9]" },
	[0x43] = { normal = "[F10]", shifted = "[F10]" },
	[0x44] = { normal = "[F11]", shifted = "[F11]" },
	[0x45] = { normal = "[F12]", shifted = "[F12]" },
	[0x46] = { normal = "[PRINT SCREEN]", shifted = "[PRINT SCREEN]" },
	[0x47] = { normal = "[SCROLL LOCK]", shifted = "[SCROLL LOCK]" },
	[0x48] = { normal = "[PAUSE]", shifted = "[PAUSE]" },
	[0x49] = { normal = "[INSERT]", shifted = "[INSERT]" },
	[0x4A] = { normal = "[HOME]", shifted = "[HOME]" },
	[0x4B] = { normal = "[PAGE UP]", shifted = "[PAGE UP]" },
	[0x4C] = { normal = "[DELETE]", shifted = "[DELETE]" },
	[0x4D] = { normal = "[END]", shifted = "[END]" },
	[0x4E] = { normal = "[PAGE DOWN]", shifted = "[PAGE DOWN]" },
	[0x4F] = { normal = "[RIGHT ARROW]", shifted = "[RIGHT ARROW]" },
	[0x50] = { normal = "[LEFT ARROW]", shifted = "[LEFT ARROW]" },
	[0x51] = { normal = "[DOWN ARROW]", shifted = "[DOWN ARROW]" },
	[0x52] = { normal = "[UP ARROW]", shifted = "[UP ARROW]" },
	[0x53] = { normal = "[NUM LOCK]", shifted = "[NUM LOCK]" },	
	[0x54] = { normal = "/", shifted = "/" },
	[0x55] = { normal = "*", shifted = "*" },
	[0x56] = { normal = "-", shifted = "-" },
	[0x57] = { normal = "+", shifted = "+" },
	[0x58] = { normal = "[ENTER]", shifted = "[ENTER]" },
	[0x59] = { normal = "1", shifted = "[END]" },
	[0x5A] = { normal = "2", shifted = "[DOWN ARROW]" },
	[0x5B] = { normal = "3", shifted = "[PAGE DOWN]" },
	[0x5C] = { normal = "4", shifted = "[LEFT ARROW]" },
	[0x5D] = { normal = "5", shifted = "5" },
	[0x5E] = { normal = "6", shifted = "[RIGHT ARROW]" },
	[0x5F] = { normal = "7", shifted = "[HOME]" },
	[0x60] = { normal = "8", shifted = "[UP ARROW]" },
	[0x61] = { normal = "9", shifted = "[PAGE UP]" },
	[0x62] = { normal = "0", shifted = "[INSERT]" },
	[0x63] = { normal = ".", shifted = "[DELETE]" },
	[0x65] = { normal = "[APPLICATION]", shifted = "[APPLICATION]" },
	[0x66] = { normal = "[POWER]", shifted = "[POWER]" },
	[0x67] = { normal = "=", shifted = "=" },
	[0x68] = { normal = "[F13]", shifted = "[F13]" },
	[0x69] = { normal = "[F14]", shifted = "[F14]" },
	[0x6A] = { normal = "[F15]", shifted = "[F15]" },
	[0x6B] = { normal = "[F16]", shifted = "[F16]" },
	[0x6C] = { normal = "[F17]", shifted = "[F17]" },
	[0x6D] = { normal = "[F18]", shifted = "[F18]" },
	[0x6E] = { normal = "[F19]", shifted = "[F19]" },
	[0x6F] = { normal = "[F20]", shifted = "[F20]" },
	[0x70] = { normal = "[F21]", shifted = "[F21]" },
	[0x71] = { normal = "[F22]", shifted = "[F22]" },
	[0x72] = { normal = "[F23]", shifted = "[F23]" },
	[0x73] = { normal = "[F24]", shifted = "[F24]" },
	[0x7F] = { normal = "[MUTE]", shifted = "[MUTE]" },
	[0x80] = { normal = "[VOLUME UP]", shifted = "[VOLUME UP]" },
	[0x81] = { normal = "[VOLUME DOWN]", shifted = "[VOLUME DOWN]" },
	[0x85] = { normal = ",", shifted = "," },
	[0x86] = { normal = "=", shifted = "=" }
}


HID = 0x03     

KEYBOARD_MODIFIER_OFFSET = 0
KEYBOARD_KEY_OFFSET = 2

FLIPPER_MODIFIER_OFFSET = 1
FLIPPER_KEY_OFFSET = 3

usb_keyboard_protocol = Proto("usb_keyboard",  "USB Keyboard")
keyboard_key_field   = ProtoField.uint8("usb_keyboard.key",   "Key")
keyboard_modifier_field = ProtoField.int8 ("usb_keyboard.modifier", "Modifier")
usb_keyboard_protocol.fields = { keyboard_key_field, keyboard_modifier_field }


-- The modifier byte holds a bitmask of the modifier keys. This function extract them
function extract_modifier_keys(modifier_byte)
	if modifier_byte == 0 then
		return
	end

    local active_keys = {}
	local shift_on = false
	
    for _, key in ipairs(MODIFIER_KEYS) do
	    if bit.band(modifier_byte, key.value) ~= 0 then -- bitwise AND in Lua 5.2.4 which is the version in latest Wireshark
			if key.value == 0x02 or key.value == 0x20 then
				shift_on = true
			end
			
			table.insert(active_keys, key.name)
		end
    end

    return shift_on, table.concat(active_keys, " ")
end


function parse_key(tvb, modifier_offset, key_offset)
	local shift_on, modifiers_on = extract_modifier_keys(tvb(modifier_offset, 1):int())	
	local key_found = KEY_MAP[tvb(key_offset, 1):int()]
	
	local key_value
	if key_found ~= nil then
		if shift_on then
			key_value = key_found.shifted
		else
			key_value = key_found.normal
		end
	end

	return key_value, modifiers_on
end


function parse_usb_keyboard(tvb, pinfo, tree)
	if tvb:len() ~= 8 then 
		return 
	end

	local key_value, modifiers_on = parse_key(tvb, KEYBOARD_MODIFIER_OFFSET, KEYBOARD_KEY_OFFSET)
	if key_value ~= nil or modifiers_on ~= nil then
		pinfo.cols.protocol = "USB Keyboard"
	end
	
	return key_value, modifiers_on, KEYBOARD_KEY_OFFSET, KEYBOARD_MODIFIER_OFFSET
end


function parse_flipperzero_badusb_keyboard(tvb, pinfo, tree)
	local flipper_indicator = tvb(0,1):int()
	if flipper_indicator ~= 0x01 then
		return
	end
	
	local key_value, modifiers_on = parse_key(tvb, FLIPPER_MODIFIER_OFFSET, FLIPPER_KEY_OFFSET)
	if key_value ~= nil or modifiers_on ~= nil then
		pinfo.cols.protocol = "Flipper Zero BadUSB"
	end
	
	return key_value, modifiers_on, KEYBOARD_KEY_OFFSET, KEYBOARD_MODIFIER_OFFSET

end


function parse_all(tvb, pinfo, tree)	
	local key_value, modifiers_on, key_offset, modifier_offset = parse_flipperzero_badusb_keyboard(tvb, pinfo, tree)
	if key_value ~= nil or modifiers_on ~= nil then
		return key_value, modifiers_on, key_offset, modifier_offset
	end

	-- default to normal usb keyboard/rubbery ducky
	return parse_usb_keyboard(tvb, pinfo, tree)
end


function usb_keyboard_protocol.dissector(tvb, pinfo, tree)
	if tvb:len() == 0 then 
		return 
	end

	local key_value, modifiers_on, key_offset, modifier_offset = parse_all(tvb, pinfo, tree)	
	if key_value == nil and modifiers_on == nil then 
		return 
	end
	
	pinfo.cols.info:append(" Key: ")
	local subtree = tree:add(usb_keyboard_protocol, tvb(), "Keyboard")
	-- Add keys to protocol column and dissection part
	if modifiers_on ~= nil then 
		pinfo.cols.info:append(modifiers_on .. " ")
		subtree:add(keyboard_modifier_field, tvb(modifier_offset, 1)):set_text("Modifier Keys: " .. modifiers_on)
	end
	if key_value ~= nil then 
		pinfo.cols.info:append(key_value)
		subtree:add(keyboard_key_field, tvb(key_offset, 1)):set_text("Key: " .. key_value)
	end
end



DissectorTable.get("usb.interrupt"):add(HID, usb_keyboard_protocol)


