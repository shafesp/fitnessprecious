-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2021 at 06:42 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(1, 'Gym Equipment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'shafe pahochiya', 'shafesp4@gmail.com', '9537771773', 'test query \r\ncheck\r\n', '2021-02-24 22:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `state`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `added_on`) VALUES
(12, 21, 'test', 'test', 'Bihar', 383345, 'COD', 11999, 'Success', 5, '2021-03-23 04:57:39'),
(13, 23, '20, ram park', 'varanasi', 'Uttar Pradesh', 110002, 'COD', 18999, 'Success', 5, '2021-03-23 05:10:06'),
(14, 24, 'test', 'test', 'Chhattisgarh', 110001, 'COD', 1076000, 'Success', 5, '2021-03-24 05:36:14'),
(16, 25, 'test2', 'test2', 'Dadar and Nagar Have', 110004, 'COD', 16493, 'Success', 5, '2021-03-25 07:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`, `added_on`) VALUES
(19, 11, 21, 1, 11999, '0000-00-00 00:00:00'),
(20, 12, 21, 1, 11999, '0000-00-00 00:00:00'),
(21, 13, 16, 1, 18999, '0000-00-00 00:00:00'),
(22, 14, 16, 4, 18999, '0000-00-00 00:00:00'),
(23, 14, 15, 5, 200000, '0000-00-00 00:00:00'),
(24, 15, 16, 1, 18999, '0000-00-00 00:00:00'),
(25, 16, 21, 1, 11999, '0000-00-00 00:00:00'),
(26, 16, 14, 6, 749, '0000-00-00 00:00:00'),
(27, 17, 16, 1, 18999, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` varchar(128) NOT NULL,
  `price` varchar(128) NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` text NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(1, 1, 'Weight Training Rack', '44999', '37999', 5, '907915941_p1615090.jpg.png', 'Gender- NO GENDER\r\nMAX LOAD- 200 kg\r\nTYPE OF RACK - Weight training bar rack', 'Where serious squatting takes place. In fitness and strength training, the squat exercise trains your full body.  All serious strength training regiments should incorporate the squat station gym equipment.\r\nPro Tip: Be sure to squat down until your thighs are pretty much parallel with the floor. Going this low is essential in doing squats the right way and obtaining a strong core, legs, and back eventually.\r\nTry to keep your knees from extending past your toes, your butt should be out and back straight when doing squats. Do not arch your back, keep your head up and your abs tight to help you with this.\r\nYour feet positioning should be just slightly wider than hip-width, and both of your feet should be pointing slightly outward.\r\nMuscles Used: Squatting focuses primarily on thighs, hips, and butt, quads, hamstrings; all while strengthening your bones and ligaments.', 0, 'Weight Training Rack Chin-up / Squat / Bench Press / Back Pull', '', '', 1),
(2, 1, 'Barbells', '1499', '949', 10, '944676912_babell.jpg.png', 'BARBELL BAR: Aurion 6 FEET , 26 MM solid weight bar is compact and convenient enough for all gyms and homes. The lifting bar features a solid chromed steel bar\r\n100-300 LBS CAPACTIY: chromed sleeve bar holds weights up to100- 300 LBS. Accommodates weight plates with 1 inch centre holes. Ergonomic design keeps storage easy. Simply clean your weighted bar to wipe away debris and sweat\r\nBENEFITS: Build and engage muscles in your arms, shoulders, and back with the lifting bar. Youâ€™ll improve productivity and endurance while boosting metabolism from the energy increase you\'ll gain with weight training\r\nSTANDARD WEIGHTLIFTING BAR: Perform a total body workout at the convenience of your own home. Workouts such as squats, dead lifts, rows, bench presses, cleans, etc will provide fast and effective results\r\nSAFETY: These weight plates are secured with Locked collars to prevent them from sliding off during the exercise.', 'A complementary piece to the squat rack. A barbell is essential to strength training, it holds the free weights, or sometimes the weights are attached to the ends.\r\nPro Tip: A barbell is perhaps the most versatile out of all the gym equipment out there. You can literally do hundreds of different exercises with these iron bars.\r\nA common technique to use when utilizing a barbell is good posture and keeping your body from swaying; in order to make sure that your body stays stabilized, as when doing exercises on a gym machine for example.\r\nBecause it is easy to cheat and swing your body whichever way to make the exercise easier, using a barbell comes with a word of caution: injuries.\r\nIt is critical to keep good form when doing barbell exercises, particularly when picking them up off the ground and placing them back down, as during that period the risk of injury is particularly high!\r\nMuscles Used: Pretty much all muscles are affected when training with barbells, especially if doing deadlifts. To better understand which exercises to do and which muscles they have a direct effect on, browse through these hundreds of barbell exercises and be sure to try some out next time youâ€™re at the gym.', 0, '26 mm Thickness Barbell Bar', '', '', 1),
(3, 1, '5Kg Rubber Hex Dumbbell', '1899', '1199', 15, '711401721_DUMBBELLS.jpg.png', 'âœ” Ideal for building and toning bicep muscles\r\nâœ”High quality rubber from outside of dumbbell\r\nâœ”In-Box Contents: 5Kg X 2 Dumbbells\r\nâœ”Handle designed to fit comfortably in palm of hands\r\nâœ” Long lasting and Most Durable Dumbbells for gyms & homes.', 'Pretty much the go-to gym equipment most people first think of when they think of bodybuilding. Varying in weight, but the same concept, a handlebar with weights on opposite ends. A must-have free weight for any fitness regiment. There are even adjustable dumbbells with differing weights all in one piece.\r\nPro Tip: Dumbbells have a lot going for them, mainly, they are inexpensive when compared to other equipment. But if used right, they can offer just as much, if not more, than some of their more lucrative gym mates.\r\nWhen working out with dumbbells, try not to lock your elbows at the end of the movement, and do not force the last few repetitions if you do not have a friend or gym buddy to spot you.\r\nDumbbells cause you to work other muscles as you are targeting a primary few; due to your body keeping balance and all the stabilizing muscles coming into play.\r\nMuscles Used: You can target a good amount of muscles with dumbbells. Below is an example of a seated dumbbell shoulder press and a bicep curl. These exercises work the biceps, shoulders, and triceps. Some of the muscles you can work with dumbbells are: chest, shoulders, triceps, traps, biceps, lats, glutes, quads, hammies, and calves.', 0, 'Dumbbells', '', '', 1),
(4, 1, 'Gym Ball with Foot Pump', '999', '599', 25, '551733900_stability ball.jpg.png', 'Constructed from durable and resilient PVC material that makes it burst resistant.\r\nThe fitness ball bearing up that make your training more casual.\r\nPerfect for providing great stability and balance to your body and make your body more slim symmetry.\r\nHelps develop overall body muscle, balance and co-ordination\r\nThis yoga ball is ideal for your various workouts.', 'The most versatile tool for fitness enthusiasts, there are countless exercises to do with an exercise ball. A perfect thing to use this stability ball for is the rehabilitation of injuries, stretching, and balance. Typically fitness enthusiasts have this tool in their home gyms, garage gym, or just laying around the house and use it every chance they get.\r\nMuscles Used: Any muscle can be worked with the stability ball.', 1, 'Stability Ball', '', '', 1),
(5, 1, 'Yoga Foam Roller', '1299', '799', 20, '633487435_foam roller.jpg.png', 'Made of eva foam, lightweight, soft to touch, rich elastic buffer, surface with massage floating point\r\nAlso can break up the soft tissue adhesions and scar tissue,Self-massage and myofascial release, break trigger points, relieve tension fascia while increasing blood flow and circulation of the soft tissue.\r\nWaterproof,anti-slip,non-toxic,tasteless,odourless,The most popular pilatesyoga trainers, can also do children\'s sporting goods,swim rod\r\nCan eliminate muscle tension, and strengthen the core muscle strength and flexibility, stretching the muscles and tendons,lipid-lowering toning\r\nPerfect tool for Yoga, Pilates, Fitness Exercises, Physiotherapy, Rehabilitation', 'A perfect tool for reducing soreness, untying muscle knots, and increasing flexibility. The best way to use a foam roller is to incorporate it into your already existing fitness regiment, it will reduce stress on your body and help your bodyâ€™s circulation.\r\nMuscles Used: Everything. You can also choose which muscle/muscle groups to target.', 0, 'Foam Roller', '', '', 1),
(11, 1, 'Heavy Weight Kettle Bell', '799', '499', 20, '635831225_kettle bells.png', 'ERGONOMIC GRIP - The Aurion Kettlebells are ergonomically designed to support your hand grip and offer extra comfort during your exercise workout routine.\r\nCHALLENGE YOUR BODY - You can challenge both your muscular and cardio system with these kettle bells, increasing your strength, endurance, agility and balance.\r\nCOLOURED AND LABELLED - Brightly coloured to differentiate between the different weights, with a clear bold label on the kettlebell too. Ideal for commercial gyms and your home.\r\nVINYL COATED - Our kettle bell is designed to last with a strong vinyl coat which is easy clean. Ideal for use indoors or outdoors for your workout needs.', 'Description: Kettlebells have become very popular in the fitness world, there are a ton of different exercises you can do with kettlebells. Fitness enthusiasts are using them for strength training and cardio. Take a look at the video for different ways to use kettlebells.\r\nMuscles Used: A lot of different muscle groups. Depends on which exercise you choose to do.', 0, 'Heavy Weight Kettle Bell', '', '', 1),
(12, 1, 'Indoor Cycle', '7999', '5499', 5, '318330964_cycle.jpg.png', 'Maintenance free belt: The belt requires minimum maintenance, improves pedaling technique, permits less momentum-based recovery, makes the rider work efficiently and operates quietly.\r\nFeatures: Wool felt belt resistance; maximum user weight supported: 100 kg; multilevel resistance; cushioned seat; LCD display showing speed, distance, time and calories burned.\r\nChallenge your strength: an adjustable tension knob allows for variable resistance levels to accommodate any workout level, from beginner to advanced intensities.\r\nCushioned adjustable seat position: Evoke fitness Bike features a vertically adjustable seat that accommodates various heights and provides proper body posture during exercise.\r\nPerfect stance: the pedal cranks are positioned close together to offer a more realistic cycling experience. Pedal with Strap provide extra stability during high intensity workout\r\nLCD digital monitor easily monitors fitness, with all relevant workout statistics illuminated on an LCD display screen. Elapsed speed, time, distance, calories burned.', 'This one is pretty simple to understand. Itâ€™s basically a more convenient alternative to biking. This is the machine youâ€™ll often see used in spin classes, but you can also use it individually. However, make sure not to confuse an indoor cycling bike with other exercise bikes such as a recumbent bike or a regular upright exercise bike.\r\nâ€¢	Indoor Cycling Bike: Designed to simulate actual biking as close as possible. Your position matches that of riding an actual bicycle.\r\nâ€¢	Recumbent Bike: This one is different in the sense that you actually sit back in the seat with your legs cycling out in front of you.\r\nâ€¢	Upright Exercise Bike: Similar to the cycling bike, but the inner mechanisms are a bit different and theyâ€™re also often more comfortable.\r\nPro Tip: Using an indoor cycling bike is similar in some ways to a regular bike but very different in other ways. You want to make sure you are staying safe to prevent injuries. Setting up properly and maintaining proper form is the key to doing this.\r\nHere are a few tips:\r\nâ€¢	Get in a seated position and lean your body forward and fix the handlebars to the point they are comfortable for you.\r\nâ€¢	You want to adjust your seat as well. You want your legs slightly bent when you are pedaling. A good rule of thumb is that if you feel pain in the front of your knees, then raise the seat, and lower it if you feel pain in the back of the knees.\r\nâ€¢	Make sure the distance between you and the handlebars is appropriate. The pedal should be below your knee when the crank is parallel to the ground.\r\nSee the video below for more info.\r\nMuscles Used:\r\nâ€¢	Calf â€“ Soleus, and gastrocnemius.\r\nâ€¢	Thigh â€“ Hamstrings and quadriceps.\r\nâ€¢	Gluts/Buttocks â€“ Gluteus maximus, medius, and minimus.\r\nâ€¢	Arms â€“ Biceps, and triceps.\r\nâ€¢	Shoulders â€“ Deltoids\r\nâ€¢	Foot â€“ Plantar flexors, and dorsiflexors', 1, 'Indoor Cycle', '', '', 1),
(13, 1, 'Peck Deck Machine', '33999', '24999', 5, '344783897_pec deck machine.jpg.png', '54 kg weIght plates set included i.e 12 plates of 10 pounds (lbs) each (total 54.4 kg)\r\nWeight of complete machine including weight is around 95 kg. Max user body weight 120 kg.\r\nAdjustable seat height. Easy open pully locks you can add your own attachment as per your requirement like tricep rope, ankle straps etc\r\nHeavy-duty construction â€“ this all-in-one home gym is made of a heavy-duty steel tube frame that is designed to last a long time\r\nBuyer has to assemble himself assembly manual and all fittings inside packaging. Assembly video available on YouTube', 'This type of gym equipment was designed to isolate and work the chest. A favorite for beginner bodybuilders as it has a unique motion that feels good when performing.\r\nPro Tip: To properly use the peck deck machine, sit back with your elbows at about 90 degrees, on the mid-chest level. Push to bring the arms together in front of your face,\r\nBreathe in as you are opening your arms, going as far back as flexibility will allow (but be careful if youâ€™re using heavy weights); breathe out as you bring the arms together again.\r\nCommon mistakes include too little travel and too much travel. Too little reduces the effect of the exercise and too much can cause injury. Do not separate the elbows from the bar, meaning youâ€™re pushing with your hands instead.\r\nMuscles Used: Chest (pectoralis major) and shoulders (deltoids)', 0, 'Peck Deck Machine', '', '', 1),
(14, 1, 'AB Wheel', '999', '749', 50, '218610100_AB wheel.jpg.png', 'Tone up your body in all the right places with these ankle weight\r\nStrengthens upper body muscles, trims your waistline, burns excess calories\r\nStretches for your back and spine\r\nIn-box Contents: AB Wheel', 'Beginners to Advanced - It is useful to all to perform varied kind of exercises. It means beginners, gym goers and professional trainer all roll on the wheel for building muscles and healthy body. You can also customize your exercises to the high intensity level in order to achieve your fitness goals easily.\r\nPerfect Fitness with a Variety of Exercises - You will get excellent AB workout with this ab roller. You can perform a variety of exercises including- Knee Rollouts, Ab Wheel Planks, V Rollouts, Wide & Narrow Stance Front Rollouts, Plank to Pikes, Knee Tucks, Bridge Holds, Oblique Tucks and lots more.\r\n\r\nProper Technique to Avoid Injury - Start with a kneeling position to learn exercises technique and to know about how much stress the exercises give on your abs, back, and arms.', 0, 'AB Wheel', '', '', 1),
(15, 1, 'Leg Abduction Machine', '250000', '200000', 5, '455329185_leg adduction machine.jpg.png', 'Opening and closing your legs, pushing the weight resistance outwards. A most popular gym machine among ladies, perfect for toning legs and butt.', 'Pro Tip: This is a very specific exercise for the leg adductors, the long adductor in particular. This workout machine works well for both beginners and advanced athletes.\r\nTo stay injury-free, make sure you warm up adequately before jumping on the machine. Never be in a hurry and perform the exercise rather slowly, as it is possible to injury the muscles by doing it abruptly.\r\nOnce warmed up, avoid making these common mistakes when working out with the leg adduction/leg abduction gym equipment: not using enough weight, opening your legs too wide, and doing the exercise too rapidly.\r\nMuscles Used: Adductors primarily.\r\nSecondary muscles included are deep gluteus maximus, pectineus, gracilis, quadratus femoris, external obturator, iliopsoas, and hamstrings.', 0, 'Leg Adduction/Abduction Machine', '', '', 1),
(16, 1, 'Hack Squat Machine', '23999', '18999', 5, '850372691_hack sqaut machine.jpg.png', 'This machine combines the leg press machine and the squat machine for a super quad-core combo. Another great piece of gym equipment to use on leg day.', 'Pro Tip: Common mistakes people make when using the hack squat machine is going too far down with a heavy load, and entering what is known as the deep squat.\r\nAnother mistake is the locking of the knees when reaching the top of the movement. The reason this is dangerous is that you are resting the weight on the ligaments instead of the powerful leg muscles. In addition to this, not pushing with both legs equally also results in improper form.\r\nThe gluteus maximus is the largest and strongest muscle in our bodies, this is why really heavyweights are needed, for it to develop. Interestingly enough, it is not really involved in normal walking, go figure!\r\nMuscles Used: Gluteus maximus, quadriceps, adductors, hamstrings, lower back, and lower spine.', 1, 'Hack Squat Machine', '', '', 1),
(17, 1, 'Leg Press Machine', '89999', '75000', 5, '547620863_Leg Press Machine.jpg.png', 'With the Real Swiss Strength Preacher Curl, also known as \"The Preacher Bench\", you will take more tension in your biceps and take the load off your wrists. This exercise can be done with dumbbells or Z curl bars.\r\nThe large press cart allows for a variety of exercises.\r\nThe machine uses the same muscles that work when doing squatsfromconstant load.\r\nThe backrest angle can be set in 4 positions: 25 Â° -30 Â° -35 Â° -40 Â°.\r\nRange of limitation of movement in flexion in 5 positions.', 'Ultimate leg training machine. Laying down with you back against a makeshift wall, push the platform/weights upwards; do not lock your joints. Perfect machine to train legs with.\r\nPro Tip: This machine is just as good as the squat machine as far as building strength and developing the muscle, however, it is good for protecting the back, due to the machine (with your help) holding it in position.\r\nCommon mistakes fitness enthusiasts make when performing the leg press exercise are lifting the hips as the weight is lowered. Also, it is advised against ever locking your knees at the top of the movement, while your legs are fully extended.\r\nIncomplete and/or exaggerated movement will not result in an efficient workout either. Finally, avoid using too much or too little weight and be sure to push with both of your legs equally.\r\nMuscles Used: Quads (quadriceps), gluteus maximus, adductors, and hamstrings.', 0, 'Leg Press Machine', '', '', 1),
(18, 1, 'PREACHER BENCH', '3499', '2499', 5, '262505035_PREACHER BENCH.jpg.png', 'Preacher Curl Arm Exercises (With 120 Kg, Holding Capacity).\r\nAdjustable positions make it easy to design diverse, efficient workout routines. Easy to assemble: clear and simple Instructions provided with user manual make it easy to assemble, not only for the gym, but also for home and office.\r\nSuitable for all fitness levels abdominal exercise equipment, multiple positions can be adjusted to accommodate different heights and provide different fitness levels. Gradually increase the intensity of your workout sessions. You only need one piece of sporting equipment for each body part training, such as back, arm, hips, abdomen, chest and leg combined in one exercise.\r\nThick bench cushion provides more support for your spine, giving you a more efficient workout. This product has non-slip foam padded handles which secure your ankles and legs for safely.\r\nRecommended Maximum user weight is 105 Kgs.', 'While seated, the preacher curl bench helps you isolate and train your biceps. A perfect place for beginners to start biceps training by utilizing a lighter barbell and lifting up and down; slowly bringing the weight down.\r\nPro Tip: Sit with your underarms at the top of the edge and your triceps resting on the preacher bench pad. Whether you are doing one-handed dumbbell exercises, such as hammer grips or one arm twists, or whether you are using a barbell, follow the above technique.\r\nContrary to popular belief, this workout is not superior in building that biceps â€œpeak.â€ But it does prevent you from cheating when working out biceps and provides them with a precise contraction; separating the elbow movement from the rest of your body.\r\nDo not extend your arm too far, as this can result in injury.  Also do not shift your body downwards toward the weight, just to get leverage and complete the curl. Most importantly, do not use too much weight and combine that with lowering the bar or dumbbell too far down.\r\nMuscles Used: Biceps, brachialis, and forearms.', 0, 'PREACHER BENCH', '', '', 1),
(19, 1, 'Adjustable Bench 4-in-1', '14999', '8999', 10, '283054578_bench press.jpg.png', 'MULTI-FUNCTION Workout Bench and Barbell Rack can be used Separately or in combination, Including squats, weightlifting, leg curls, barbell dumbbell and sit-ups which works for your chest, shoulders, biceps, legs, and more with total ( WEIGHT of 350 kg ) can be lifted\r\nYour satisfaction is our final goal, If your product does not perform to your expectations\r\nPREMIUM CONSTRUCTION with built-in Safety Hooks and No-pinch Design to prevent injury to hand and grip.Made of metal and imitation Leather, it\'s stable and sturdy.High-temperature multi-step painting process, moisture proof and anti-rust. provide optimal support for daily workouts\r\nWeight Bench Backrest adjusts for flat/incline positions. Adjustable uprights can be adjusted. Height adjustable and folded design brings more convenience to your exercising\r\nThis training bench is great for a wide variety of full-body workouts, such as Flat Bench Presses/Incline Dumbbell Bench Press/One-Arm Dumbbell Preacher Curl/ Leg Extension', 'Used for upper body strength training exercises, where you are pushing weight upwards as youâ€™re laying on your back. Do you want the perfect chest? This is one of the tools you use to train for that chest.\r\nPro Tip: When doing a bench press, do not arch your back, this means that your feet are placed too low. Try not to bounce the bar off your chest either, even though you may think it makes you look super macho.\r\nAlso, do not lower the bar towards your neck or abdomen as it could seriously injure you is you have excessive weight and lose control, even momentarily.\r\nFinally, try not to lock your elbows at the apex of the movement, keep your feet, back, and head still!\r\nMuscles Used: Biceps, Triceps, Lats, Shoulders, Chest, and Upper Back. There are different techniques when doing a bench press, three main ones are: close grip, wide grip, and close grip with elbows in.', 0, 'Adjustable Bench press', '', '', 1),
(20, 1, 'Motorized Treadmill', '20000', '13999', 10, '661113217_treadmill.jpg.png', 'Active post-sales and customer support Through 650+ cities free at-home installation services all across India.\r\n\r\nFree Personal Dietitian (3 Months) and Personal Training Video Session \r\n\r\nTreadmill connects with the Fitplus App available on Android & IOS platforms\r\n\r\nIt is equipped with a powerful 1.25HP (Continuous) and 2HP (Peak) efficient DC Motor, Inclination Level 0, Easy Lubrication for easy maintenance , a Speed Range of 0.8-14km/hr\r\n\r\nMaximum user weight capacity - 90 kg\r\n\r\n\r\nWarranty: 1 Year Warranty on Motor and Manufacturing Defect', 'What is a treadmill?\r\nThe treadmill is a great way to practice walking or running at any pace youâ€™re comfortable within an indoor setting â€“ this is fantastic for those who prefer home based exercise or those who arenâ€™t confident running outside.\r\nWhat areas / muscles does a treadmill work?\r\nPrimarily your lungs in regards to developing your general fitness but treadmills can also provide a great core and leg workout (you use these areas when you run) especially when used with an incline (uphill) setting.\r\nWhat can I do with a treadmill?\r\nOne of the best aspects of cardio (cardiovascular) machinery is that the world is your oyster! You can perform steady state (long distance) cardio at a moderate intensity or crank things up and perform some interval training (varying intensities on repeat) as well as performance based cardio at higher intensities.', 1, 'Motorized Treadmill', '', '', 1),
(21, 1, 'Lat Pulldown Machine', '17999', '11999', 5, '456856961_LAT PULLDOWN MACHINE.jpg.png', 'Ideal for lat pulldown,Seated row, Tricep pressdown, Bicep curls, Cable pullover, Upright row,Long Ab Strap Pulldown, Overhead Tricep Extension, One Arm Cable Curls, Side Lateral Raise, One Arm Tricep Extension, Wide Grip Seated Row, Close Grip Pulldown, Shrugs, Standing Leg Curls, Rope Extension, One Arm Crossover, Spud Ab Crunch, Double D Pressdown, Cable Shoulder Press, Face Pulls, Reversed Grip Pressdown, Front Raises, One Arm Row.\r\nPackage contains = Lat pulldown machine, V bar, Tricep Rope, Resistance handle, Cable handle.\r\nMaximum load capacity: 120 KGs;\r\nFeatures feet support with no-slip covering Adjustable seat\r\nNote : If you receive any kind of damaged due to transit damage or manufacturing defect than we will provide replacement free of cost once you confirm us through buyer seller message we will get back to you within 24 hours.', 'Used for strengthening your latissimus dorsi muscle, or lats as they are known. Pull downwards toward you, keeping your elbows and back straight. Google a picture of Bruce Lee and youâ€™ll see the lats youâ€™re capable of attaining with this machine.\r\nPro Tip: As counter-intuitive as it may sound to some people, do not lower the bar to the belly; if you are doing this, it means you are not using enough weight.\r\nAvoid bending your torso to get help from your chest and ab muscles, and complete all movements when exercising with a lat pull-down machine. Your grip shouldnâ€™t be too wide and it should be even.\r\nMuscles Used: Upper and lower back. Biceps, and lats in particular (as is evident by the name of this exercise machine).', 0, 'Lat Pulldown Machine', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `mobile`, `added_on`) VALUES
(19, 'shafe', 'shafesp4@gmail.com', 'shafe@sp', '9537771773', '2021-03-23 12:14:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
