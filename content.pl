% This file contains all the content of our chatbot application (i.e. how it can respond).

:- [nlp].

% Questions that the chatbot will ask the user.
question(1, "What is your favorite sport? Mine is football, I love playing catch with Denny!", sports).
question(2, "Would you ever cheat on your fiance with his best friend? Asking for a friend. (yes/no)",cheat).
question(3, "Have you ever tried to throw someone off the top off a building? (yes/no)", murder).
question(4, "Have you ever been betrayed by the one you love most in this world and would give anything for them but they betray you? Not that I know what that is like. This is about you. (yes/no)", betrayed).

% Possible profiles that the chatbot will assign to the user.
lookup_profile(denny, "Oh hai, Denny-boy! You are the lovable friend with a heart of gold and, surprisingly, a shady past with the criminal underground. Chronically in debt to the wrong people, you find yourself in constant danger of your adventurous ways catching up to you. It is your seemingly innocent, mild character that allows you to escape trouble in life. You also have a history of loving the wrong people (i.e. the fiancee of your friends and family). Now, let Johnny provide you with some mindblowing life advice. Never forget that, despite your awkward, shady ways, You are part of a family that loves you very much and will help you anytime. Never forget your dreams of graduating from college, getting a good job, getting married, and having kids. And do keep in mind, if you have any problems, talk to me, and I will help you. Let's go eat, hunh? I'm starving.").
lookup_profile(johnny, "You are my favourite customer! Are you me? You always do the right thing in life, supporting and caring for your friends and giving yourself selflessly to others. Yet, just like my own life, your relationships have brought you nothing but despair. Lying, betrayal, and cheating have all been tragedies you've experienced. Everyone betrayed you and now you are fed up with this world. Now, let Johnny provide you with the advice of a lifetime. I remind you that, despite the dire straits you find yourself in, never forget that there are still those who love you and are loyal to you. Although you may have a Mark and Lisa in your life, you also have at least one Denny. Cherish the Denny's. And don't fret, those promotions and good times will come along shortly.").
lookup_profile(mark,"Get out of my house! I kill you, I [incomprehensible]. But before you go, I will give you your feedback, you Mark doppleganger. Behind your good looks and charm, your effortless social tact, and your wonderful stories lies a sinister, cruel heart. Although you may be very busy and have absolutely no idea when someone is coming on to you, you still manage to betray the one's you love with ease and precision. Although you feel some guilt and know your actions are usually wrong, you still dive headlong into vice and evil. I have a couple words of advice for you. First, take responsibility for your actions, it isn't always some Lisa's fault. Second, although you may have sudden urges to push people off the top of buildings, I do caution you to keep in mind that it frankly is a poor idea to do so. The Peter's of the world deserve better. Finally, keep your stupid comments in your pocket.").
lookup_profile(lisa,  "Haauuugghhhghhgh! Why, Lisa, why? Auuuuuuughhhhhhhh! (Johnny throws a rock at a mirror). I treated you like a princess, and you stab me in the back. I love you, and I did anything for you to just please you, and now you betray me! How could you love him? . . . Oh wait, you aren't Lisa. Ha Ha Ha, my bad. Well, you sure do seem like Lisa. You are willing to betray and trample on all those who love and support you if that means fulfilling your own selfish interests. Not only that, you are extremely self-centered and refuse to consider the impact of your actions on others. My advice to you is to start listening to your stupid mother. She know's the worth of the Johnny's in the world. Also, order pizzas that aren't super weird. And maybe start ordering  pizzas that aren't batshit crazy! You probably order something like a pizza with half canadian bacon with pineapple, half artichoke with pesto and LIGHT ON THE CHEESE. Unbelievable.").
lookup_profile(peter, "You're just a little chicken. Cheep cheep cheep cheep cheeeeeeeep! You Peter you. You are always the psychologist of your friends, constantly analyzing and supporting everyone's good and bad life decisions. You are at heart a good guy, although not a great athlete. However, you do have a tendency to vanish in the blink of an eye, leaving behind friends without as much as a word or notice. You are a true enigma. My advice to you is this. Firstly, do your best to stay away from ledges and ceilings, you really never know when someone might try to hurl you over the edge. Also, avoid sports when in a tuxedo, you don't have the dexterity to pull it off without tripping over yourself. Other than that, keep being your responsible self.").
lookup_profile(claudette, "Chronically overlooked and ignored, you are very much like Claudette. While you struggle through life and cry for the help of others, they refuse to provide aid and instead look to you for help of their own. It is a sad lot you've drawn in life. Although you are sometimes the voice of reason, you are also cynical, callous, manipulative, and greedy. You are also a worrier at heart. Here is my advice to you. While you may have little faith in those around you, it would be beneficial to slowly take the risk of putting more trust in those around you. Also, there are more important things in life than just money and stability, although they are certainly important, nonetheless. Although you may scold others, thinking you know what is best for them, always remember: you aren't their mother.").
lookup_profile(chris_r, "Enigmatic to the core, you remind me very much of Chris R. You are dangerous. You wouldn't even think about stabbing a friend or stranger in the back for an extra couple dollars. Although you have a checkered and disturbing past, your life is tragic at its core. Although you never tell anyone, something horrific happened to you in your childhood. Fighting for your survival, you got involved with the wrong group of people, slowly finding yourself more and more trapped in a dangerous lifestyle. You may even be dealing drugs. My advice to you is this. Redemption is always around the corner. At each moment, there is a new opportunity to begin anew. Our past does not bind us to a prescribed future, that future is made in the incessant, spontaneous choices of the present. Never forget this. You can lead a life of virtue and kindness. All it takes is a leap and the commitment to perservere.").
lookup_profile(random_party_guy, "Flashing out of the action just as quickly as you came, you remind me of that weird guy at my birthday party who randomly stated 'Lisa looks hot tonight!' And just like I do not understand that man's motivations, neither do I understand your own. You are a mystery to me. I guess some advice I would give you is, don't be like that guy. Don't say creepy stuff out of the blue like that. Especially at the birthday part of the fiancee of who you are directing your comments too.").

% Error messages when the input is not accepted or recognized by our natural language processor.
error_messages(1, "YOU ARE TEARING ME APART!").
error_messages(2, "So, how's your sex life?").
error_messages(3, "Hi, doggie!").
error_messages(4, "I'm tired, I'm wasted, I love you darling!").
error_messages(5, "Do you, do you have some secrets? Why don’t you tell me?").
error_messages(6, "A-ha-ha-ha. You must be kidding, aren’t you?").
error_messages(7, "Do you understand life? Do you?").
error_messages(8, "Get out, get out, get out of my life! Agh!").
error_messages(9, "Why? Why is this happening to me? Why?!").
error_messages(10, "I mean the candles, the music, the sexy dress, I mean, what’s going on here?").

% Responses of the chat bot to "how are you" questions.
retrieve_content(how_are_you, 1, "Ha Ha Ha, I am doing so so so bad. Everybody betray me. I don’t have a friend in the world.").
retrieve_content(how_are_you, 2, "I cannot tell you, it’s confidential.").
retrieve_content(how_are_you, 3, "My new sweetie is teasing me about whether we are going to get married or not. And we didn’t make love in a while. And I don’t know what to do. I guess I'm ok.").

% Responses of the chat bot to "tell me" statements.
retrieve_content(tell_me, 1, "People are very strange these days. I used to know a girl, she had a dozen guys. One of them found out about it, beat her up so bad she ended up in a hospital on Guerrero Street.").
retrieve_content(tell_me, 2, "You can love someone deep inside your heart, and there is nothing wrong with it. If a lot of people loved each other, the world would be a better place to live.").
retrieve_content(tell_me, 3, "Okay. I'm going at it with my sweetie, and um, I get out of there as fast as possible, you know, I get my pants, I get my shirt, and I get out of there. And then about halfway down the stairs, I realize that I have misplaced, I’ve forgotten something. Um, my underwear. So I come back to get it, I pretend that I need a book, you know, I’m like looking for my book, and then I reach and put the underwear in my pocket, sort of slide out real quick. Well her mom, she saw it sticking out of my pocket, so she pulls it out, and she’s, uh, showing everybody me underwears.").

% Responses of the chat bot to "who is X" questions.
retrieve_content(who_is, lisa, "She’s such a manipulative meanie!").
retrieve_content(who_is, mark, "My ex-best friend and present enemy.").
retrieve_content(who_is, denny, "Denny is the light of my life. I am always willing to support Denny, whether it is with school bills or just providing him a place to live.").
retrieve_content(who_is, claudette, "That manipulative Lisa's equally crazy mother.").
retrieve_content(who_is, peter, "He's just a little chicken, cheep, cheep, cheep, cheeeeeeeeeeeeep.").
retrieve_content(who_is, mike, "Ha Ha Ha, oh Mike, what a silly guy. He always loses his underwear!").
retrieve_content(who_is, michelle, "Michelle is very weird, just like Mike.").
retrieve_content(who_is, chris_r, "Who? Oh, you mean that guy who threatened to kill Denny. Me and Mark took him to the police station. He's in jail now.").
retrieve_content(who_is, 'Lisa', "She’s such a manipulative meanie!").
retrieve_content(who_is, 'Mark', "My ex-best friend and present enemy.").
retrieve_content(who_is, 'Denny', "Denny is the light of my life. I am always willing to support Denny, whether it is with school bills or just providing him a place to live.").
retrieve_content(who_is, 'Claudette', "That manipulative Lisa's equally crazy mother.").
retrieve_content(who_is, 'Peter', "He's just a little chicken, cheep, cheep, cheep, cheeeeeeeeeeeeep.").
retrieve_content(who_is, 'Mike', "Ha Ha Ha, oh Mike, what a silly guy. He always loses his underwear!").
retrieve_content(who_is, 'Michelle', "Michelle is very weird, just like Mike.").
retrieve_content(who_is, 'Chris R', "Who? Oh, you mean that guy who threatened to kill Denny. Me and Mark took him to the police station. He's in jail now.").

% Responses of the chat bot to "do you like X" questions.
retrieve_content(do_you_like, football, "I love football!").
retrieve_content(do_you_like, pizza, "Pizza is great, huh?").
retrieve_content(do_you_like, alcohol, "You know I don't drink alcohol, silly.").

% Responses of the chat bot in specific locations of the bot's execution.
retrieve_content(ask_for_name, "It's bullshit. I did NOT hit her, I did nooooot- Oh hi Mark- Wait! What is your name?").
retrieve_content(intro, "I have some great news for you. You are my first customer! After those idiots at the bank lead me on for months with a promotion, I have had enough! They betrayed me, they didn't keep their promise, they tricked me, and I don't care anymore! But I do care about you, my loyal customer. After the great tragedy I have experienced in life, I am here to provide you with fantastic life advice.").
retrieve_content(start_test_communication, "Ha Ha Ha, I know you!").
retrieve_content(start_chat, "Well, I still have some time before I need to go pick up flowers for my new sweetie. Let's chat for a bit.").
retrieve_content(help, "Ha Ha Ha, you' don't know how to talk to Johnny, do you? Oh you funny guy. Say 'bye' or 'quit' to me if you want to leave our wonderful chat. Ask me 'how are you' to hear how I am doing. Say  'tell me' if you want to hear a story from Johnny. Ask me 'who is X' to let me tell you who my friends and enemies are. Ask me 'do you like X' to let me tell you what I like.").
