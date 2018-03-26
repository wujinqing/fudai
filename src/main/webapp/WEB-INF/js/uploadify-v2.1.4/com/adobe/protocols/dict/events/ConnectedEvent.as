package js.uploadify - v2
{
	import flash.events.Event;
	import com.adobe.protocols.dict.Dict;

	public class ConnectedEvent extends Event
	{
		public function ConnectedEvent()
		{
			super(Dict.CONNECTED);
		}
		
	}
}