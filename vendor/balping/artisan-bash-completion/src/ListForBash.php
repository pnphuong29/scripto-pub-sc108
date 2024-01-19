<?php

/*
	Artisan Bash Completion
	Adds bash completion for Laravel 5.5 artisan CLI.
	Copyright (C) 2023  Balázs Dura-Kovács

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

namespace Balping\ArtisanBashCompletion;

use Illuminate\Console\Command;

class ListForBash extends Command {

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Lists commands for bash completion.';

	protected $signature = 'list:forBash {pos : index of currently completed word} {line? : whole line typed} {words? : List of words typed}';

	/**
	 * Execute the console command.
	 *
	 * @return void
	 */
	public function handle()
	{
		$arguments = $this->argument('line');
		$bashWords = explode(' ', $this->argument('words'));
		$bashWordPos = intval($this->argument('pos'));

		$lineWords = explode(' ', $arguments);

		if($lineWords[0] != "artisan"){
			return;
		}

		// find $bashWordPos in $lineWords
		$lineWordPos = 0;
		$currentWord = '';
		$bash2linepos = []; // maps bash word pos to line word pos
		for($i = 0; $i<count($bashWords); $i++){
			$currentWord .= $bashWords[$i];
			$bash2linepos[$i] = $lineWordPos;
			if($currentWord == $lineWords[$lineWordPos]){
				$lineWordPos++;
				$currentWord = '';
			}
		}

		$toBeCompleted = $lineWords[$bash2linepos[$bashWordPos]];
		$lineWords[0] = '';


		$app = $this->getApplication();

		$parseCommand = new \ReflectionMethod(\Illuminate\Console\Application::class, 'parseCommand');
		$parseCommand->setAccessible(true);
		[$commandName, $input] = $parseCommand->invoke($app, implode(' ', $lineWords), []);

		$matches = [];

		// we want to complete the command, not an option
		if($commandName == $toBeCompleted){
			$allCommands = array_keys($app->all());

			$matches = array_filter($allCommands, fn($c) => str_starts_with($c, $toBeCompleted));

			if($colonPos = strpos($toBeCompleted, ':')){
				$matches = array_map(fn($m) => substr($m, $colonPos+1), $matches);
			}

		}else if($app->has($commandName)){
			$command = $app->get($commandName);

			$options = $command->getDefinition()->getOptions();
			$getDefaultInputDefinition = new \ReflectionMethod(get_class($app), 'getDefaultInputDefinition');
			$getDefaultInputDefinition->setAccessible(true);
			$defaultOptions = $getDefaultInputDefinition->invoke($app)->getOptions();
			$options = array_merge($options, $defaultOptions);

			foreach($options as $option){
				$long_form = '--' . $option->getName();
				if($option->isValueRequired() || $option->isArray()){
					$long_form .= '=';
				}
				$matches[] = $long_form;
				if($option->isNegatable()){
					$matches[] = '--no-' . $option->getName();
				}
				if($shortcut = $option->getShortcut()){
					foreach(explode('|', $shortcut) as $sc)
					$matches[] = '-' . $sc;
				}
			}

			$matches = array_filter($matches, fn($o) => str_starts_with($o, $toBeCompleted));
		}

		echo implode(' ', $matches);

	}

}
