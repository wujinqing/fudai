package js.uploadify - v2
{
	import flash.events.Event;
	import com.adobe.protocols.dict.Dict;

	public class NoMatchEvent
		extends Event
	{
		public function NoMatchEvent()
		{
			super(Dict.NO_MATCH);
		}
	}
}