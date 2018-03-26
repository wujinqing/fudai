package js.uploadify - v2
{
	import flash.events.Event;
	import com.adobe.protocols.dict.Dict;

	public class DisconnectedEvent extends Event
	{
		public function DisconnectedEvent()
		{
			super(Dict.DISCONNECTED);
		}
		
	}
}