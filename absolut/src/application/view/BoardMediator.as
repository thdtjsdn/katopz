package application.view
{
	import application.ApplicationFacade;
	import application.model.CrystalDataProxy;
	import application.model.Rules;
	import application.view.components.Board;
	import application.view.components.Crystal;
	
	import com.greensock.TweenLite;
	import com.sleepydesign.display.SDSprite;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class BoardMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "BoardMediator";

		private var data:CrystalDataProxy;

		public function BoardMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);

			data = facade.retrieveProxy(CrystalDataProxy.NAME) as CrystalDataProxy;

			//board.soundState = data.soundState;
			board.moveSignal.addOnce(onTileClick);
		}

		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.START_GAME,
				ApplicationFacade.RESTART_GAME,
				ApplicationFacade.GAME_OVER,
				ApplicationFacade.DRAWN_GAME,
				ApplicationFacade.SOUND_CHANGE];
		}

		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case ApplicationFacade.START_GAME:
					//already shuffle data while init//board.shuffle();
					board.enabled = true;
					break;

				case ApplicationFacade.RESTART_GAME:
					//already shuffle data by command//board.shuffle();
					board.enabled = true;
					break;
				
				case ApplicationFacade.GAME_OVER:
					//board.drawWinLine(y1, x1, y2, x2, tile);
					//board.setBoardEnabled(false);
					break;

				case ApplicationFacade.DRAWN_GAME:
					//board.setBoardEnabled(false);
					break;

				case ApplicationFacade.SOUND_CHANGE:
					//board.soundState = notification.getBody() as Boolean;
					break;
			}
		}

		protected function get board():Board
		{
			return viewComponent as Board;
		}

		private function onTileClick(event:Event):void
		{
			sendNotification(ApplicationFacade.USER_MOVE);
		}
	}
}