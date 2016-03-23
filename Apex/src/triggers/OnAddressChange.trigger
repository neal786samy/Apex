trigger OnAddressChange on Account (before update) 
{
    OnAddressChangeHandler handlerObj=new OnAddressChangeHandler(); 
    handlerObj.onBeforeUpdate(trigger.new,trigger.old);                             
}