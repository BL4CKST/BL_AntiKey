Citizen.CreateThread(function()
            while true do
                    Citizen.Wait(0)
                    if Config.AntiKeyInsert then
                            if IsControlJustReleased(0, 121) then
                                   TriggerServerEvent("BL_BL4CK:NoAutorizacion","INSERT")
                            end	
							
                    end
					if Config.AntiKeyALTF8 then
                            if IsControlJustReleased(0, 169) then
                                    TriggerServerEvent("BL_BL4CK:NoAutorizacion","ALT+F8")
                            end
                    end
                    if Config.AntiKeyControlF8 then
                            if IsControlJustReleased(0, 210) and IsControlJustReleased(0, 169) then
                                    TriggerServerEvent("BL_BL4CK:NoAutorizacion","CTRL + F8")
                            end
                    end
                    if Config.AntiKeyShiftG then
                            if IsControlJustReleased(0, 47) and IsControlJustReleased(0, 21) then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","SHIFT+G")
                            end
                    end
					 if Config.AntiKeyDelete then
                            if IsControlJustReleased(0, 178)  then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","DELETE")
                            end
                    end
					 if Config.AntiKeyHome then
                            if IsControlJustReleased(0, 213)  then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","HOME")
                            end
                    end
					 if Config.AntiKeyPageUp then
                            if IsControlJustReleased(0, 10)  then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","PAGEUP")
                            end
                    end
					 if Config.AntiKeyPageDown then
                            if IsControlJustReleased(0, 11)  then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","PAGEDOWN")
                            end
                    end
					 if Config.AntiKeyTab then
                            if IsControlJustReleased(0, 37)  then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","TAB")
                            end
                    end
					 if Config.AntiKeyCaps then
                            if IsControlJustReleased(0, 137)  then
                                 TriggerServerEvent("BL_BL4CK:NoAutorizacion","CAPS")
                            end
                    end
                   
            end
end)
