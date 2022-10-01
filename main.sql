create database Facebook;
use Facebook;

Create table user_profile(
	username varchar(20) primary key,
    name_first varchar(25),
    name_last varchar(25),
    user_password varchar(8),
    date_of_birth datetime
);
Create table user_post(
	post_id varchar(10) primary key,
    created_timestamp datetime,
    modified_timestamp datetime,
    text_content varchar(100),
    username varchar(20),
    foreign key (username) references user_profile(username)
);
create table post_like(
	post_like_id varchar(10) primary key,
    time_stamp datetime,
    post_id varchar(10),
    username varchar(20),
    foreign key (post_id) references user_post(post_id),
    foreign key (username) references user_profile(username)
);
create table post_comment(
	post_comment_id varchar(10) primary key,
    time_stamp datetime,
    text_content varchar(100),
    post_id varchar(10),
    username varchar(20),
    foreign key (post_id) references user_post(post_id),
    foreign key (username) references user_profile(username)
);
create table friendship(
	profile_req varchar(20),
    profile_accept varchar(20),
    foreign key (profile_req) references user_profile(username),
    foreign key (profile_req) references user_profile(username),
    primary key (profile_req,profile_accept)
);
create table user_profile_email(
	username varchar(20),
    foreign key (username) references user_profile(username),
    email varchar(20),
    primary key (username,email)
);
create table user_profile_contact(
	username varchar(20),
    foreign key (username) references user_profile(username),
    contact_number integer(10),
    primary key (username,contact_number)
);
create table user_post_image(
	post_id varchar(10),
    foreign key (post_id) references user_post(post_id),
    image_url varchar(30),
    primary key (post_id,image_url)
);
create table user_post_comment(
	post_id varchar(10),
    foreign key (post_id) references user_post(post_id),
    video_url varchar(30),
    primary key (post_id,video_url)
);
create table messages(
	message_sender varchar(20),
    message_receiver varchar(20),
    foreign key (message_sender) references user_profile(username),
    foreign key (message_receiver) references user_profile(username),
    primary key (message_senfer, message_receiver)
);