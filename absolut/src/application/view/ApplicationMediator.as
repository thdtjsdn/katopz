package application.view
{
	import application.ApplicationFacade;
	import application.model.CrystalDataProxy;
	import application.view.components.Board;
	import application.view.components.Menu;

	import flash.display.StageScaleMode;
	import flash.events.Event;

	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ApplicationMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ApplicationMediator";

		// Model
		private var data:CrystalDataProxy;

		// Assets
		private var menu:Menu;
		private var board:Board;

		public function ApplicationMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);

			// Stage setup.
			main.stage.scaleMode = StageScaleMode.NO_SCALE;

			// Retrieve proxies.
			data = facade.retrieveProxy(CrystalDataProxy.NAME) as CrystalDataProxy;

			drawAssets();
		}

		override public function listNotificationInterests():Array
		{
			return [ApplicationFacade.GAME_OVER, 
				ApplicationFacade.RESTART_REQUEST, 
				ApplicationFacade.DRAWN_GAME];
		}

		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case ApplicationFacade.GAME_OVER:
					var winner:Number = notification.getBody().tile;
					/*
					   if ( winner == 1 )
					   {
					   userWinCount.text = "USR:" + data.userWinCount;
					   }
					   else
					   {
					   AIWinCount.text = "CPU:" + data.AIWinCount;
					   }
					 */
					break;

				case ApplicationFacade.RESTART_REQUEST:
					//TODO : warn before shuffle
					//bypass comfirm and send notification
					sendNotification(ApplicationFacade.RESTART_GAME);
					break;

				case ApplicationFacade.DRAWN_GAME:
					/*
					   showModal();
					   showAlert("Only draw is available.\nTry again.", AlertBox.OK);

					   alignContent();
					 */
					break;
			}
		}

		protected function get main():Main
		{
			return viewComponent as Main;
		}

		private function drawAssets():void
		{
			board = new Board();
			facade.registerMediator(new BoardMediator(board));
			main.addChild(board);

			menu = new Menu();
			facade.registerMediator(new MenuMediator(menu));
			main.addChild(menu);
		}

		private function onSoundOn(event:Event):void
		{
			//
		}

		private function onSoundOff(event:Event):void
		{
			//
		}

		private function setSound(value:Boolean):void
		{
			//
		}
	}
}